require 'rails_helper'

RSpec.describe "Exames", type: :request do
  describe "GET /index" do
    context "login with user patient" do
      let!(:user) { create(:user, :patient) }
      it "returns http success" do
        login_as(user)
        
        get root_path
          expect(response).to have_http_status(:success)
      end
    end

    context "login with user doctor" do
      let!(:user) { create(:user, :doctor) }
      it "returns http success" do
        login_as(user)
        
        get root_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET /new" do
    context "login in user patient" do
      let!(:user) { create(:user, :patient) }
      it "returns http unauthorized" do
        login_as(user)
        get new_exame_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "login with user doctor" do
      let!(:user) { create(:user, :doctor) }
      it "returns http success" do
        login_as(user)

        get new_exame_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST /create' do
    let!(:user_patient) { create(:user, :patient) }
    let(:valid_attributes) { attributes_for(:exame, patient_id: user_patient.patient.id) } 
    let(:invalid_attributes) { attributes_for(:exame, patient: nil) } 

    context 'with valid parameters' do
      let!(:user) { create(:user, :doctor) }

      it 'creates a new Exame' do
        login_as(user)
        expect do
          post exames_url,
            params: { exame: valid_attributes }
        end.to change(Exame, :count).by(1)
      end

      it 'redirects to the created Exame' do
        login_as(user)
        post exames_url, params: { exame: valid_attributes }

        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid parameters' do
      let!(:user_patient) { create(:user, :patient) }
      let!(:user) { create(:user, :doctor) }

      it 'does not create a new Exame' do
        login_as(user)
        expect do
          post exames_url,
            params: { exame: invalid_attributes }
        end.to change(Exame, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        login_as(user)
        post exames_url,
          params: { exame: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "login with user patient" do
      let!(:user) { create(:user, :patient) }
      it "returns http success" do
        login_as(user)
        post exames_url,
          params: { exame: invalid_attributes }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'PUT /update' do
    let(:valid_attributes) { attributes_for(:exame) } 
    let(:invalid_attributes) { attributes_for(:exame, description: 10) } 

    context 'with valid parameters' do
      let!(:user) { create(:user, :doctor) }
      let!(:exame) { create(:exame) }

      it 'update a new Exame' do
        login_as(user)
        put exame_url(exame),
          params: { exame: valid_attributes }

        exame.reload
        expect(exame.description).to eq(exame.description)
      end

      it 'redirects to the created Exame' do
        login_as(user)
        put exame_url(exame), params: { exame: valid_attributes }

        expect(response).to redirect_to(root_path)
      end
    end
    
    context "login with user patient" do
      let!(:exame) { create(:exame)}
      let!(:user) { create(:user, :patient) }
      it "returns http success" do
        login_as(user)

        put exame_url(exame),
          params: { exame: invalid_attributes }

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
