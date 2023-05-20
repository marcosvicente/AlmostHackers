require 'rails_helper'

RSpec.describe ExameService, type: :service do
  describe "#call" do
    context ".current_user patient" do
      let!(:patient) { create(:patient) }
      let!(:exame) { create_list(:exame, 10, patient: ) }
      it "should be call exame from patient" do
        klasses = described_class.new(patient.user).call

        klasses.each do |klass|
          expect(klass.patient_id).to eq(patient.id)
        end
      end
    end
    
    context ".current_user doctor" do
      let!(:doctor) { create(:doctor) }
      let!(:exame) { create_list(:exame, 10, doctor: ) }
      it "should be call exame from doctor" do
        klasses = described_class.new(doctor.user).call

        klasses.each do |klass|
          expect(klass.doctor_id).to eq(doctor.id)
        end
      end
    end

    context "fail user user" do
      let!(:user) { create(:user, user_type: "admin")}
      it "should be return error from wronge user" do
        klass = described_class.new(user).call

        expect(klass[:message]).to eq("Error not found type user")
        expect(klass[:status]).to eq(401)
      end
    end
  end
end