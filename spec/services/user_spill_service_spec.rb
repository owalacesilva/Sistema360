require "rails_helper"

RSpec.describe UserSpillService do
  describe "when call action" do
    let(:user_sponsor_spilled) { create(:user_spilled) }
    let(:user_sponsor_not_spilled) { create(:user) }

    context "with valid parameters" do
      let(:user) { create(:user, sponsor: user_sponsor_spilled) }
      let(:user_spill) { create(:user_spill_queue, user: user, user_sponsor: user_sponsor_spilled) }
      let!(:service) { described_class.call(user_spill) }

      it { expect(service).to be_success }
      it { expect(service.result).to be_an_instance_of(UserNetwork) }

      it "is expected user spill tasks to be spilled" do
        expect(user_spill.spilled).to eq(true)
      end
    end

    context "with user sponsor doesn't spilled" do
      let(:user) { create(:user, sponsor: user_sponsor_not_spilled) }
      let(:user_spill) { create(:user_spill_queue, user: user, user_sponsor: user_sponsor_not_spilled) }
      let!(:service) { described_class.call(user_spill) }

      it { expect(service).not_to be_success }
      it { expect(service.result).to be_nil }
      it { expect(service.errors).to eq({ errors: ["Usuário patrocinador não alocado na rede"] }) }

      it "does not change UserSpillQueue object" do
        expect(user_spill.spilled).to be_falsey
      end
    end

    context "with user alright spilled" do
      let(:user) { create(:user_spilled, sponsor: user_sponsor_spilled) }
      let(:user_spill) { create(:user_spill_queue, user: user, user_sponsor: user_sponsor_spilled) }
      let!(:service) { described_class.call(user_spill) }

      it { expect(service.errors).to eq({ errors: ["Usuário já alocado na rede"] }) }
    end
  end
end
