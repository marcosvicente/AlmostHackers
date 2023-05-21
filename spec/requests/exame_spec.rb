require 'rails_helper'

RSpec.describe "SaleFiles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/exame/new",
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    let(:valid_attributes) { attributes_for(:exame) } 
    let(:invalid_attributes) { attributes_for(:exame, patient: nil) } 

    context 'with valid parameters' do
      it 'creates a new SaleFile' do
        expect do
          post exames_url, params: { exame: valid_attributes }
        end.to change(Exame, :count).by(1)
      end

      it 'redirects to the created SaleFile' do
        post exames_url, params: { exame: valid_attributes }

        expect(response).to redirect_to(exame_url(Exame.last.id))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new SaleFile' do
        expect do
          post exames_url, params: { exame: invalid_attributes }
        end.to change(Exame, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post exames_url, params: { exame: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
