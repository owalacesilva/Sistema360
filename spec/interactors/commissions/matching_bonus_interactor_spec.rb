require "rails_helper"

def user_point(user)
  user.points.first
end

RSpec.describe Commissions::MatchingBonusInteractor do
  let(:user) { create(:user_spilled) }
  let(:order) { create(:order_complete, user: user) }
  let(:reference) { create(:reference) }

  context "with valid parameters" do
    let(:point_dist) { create(:point_distribution, user: user, order: order, reference: user_point(user).reference) }
    let(:service) { described_class.call(point_dist: point_dist, depth_level: 1) }

    it { expect(service).to be_success }
    #it { expect(service.user_point_records).to be_an_instance_of(UserPointRecord) }

    it "is expected point dist to be done" do
      expect(point_dist.done).to eq(true)
    end
  end

  context "without valid reference" do
    let(:point_dist) { create(:point_distribution, user: user, order: order, reference: reference) }
    let(:service) { described_class.call(point_dist: point_dist) }

    it { expect(service).not_to be_success }
    it { expect(service.result).to be_nil }
    #it { expect(service.errors).to eq({ errors: ["Não foi possivel encontrar a referencia"] }) }

    it "does not change point_dist object" do
      expect(point_dist.done).to be_falsey
    end

    it "does not increment user point" do
      expect(user_point(user).reload.amount).to eq(0)
    end
  end

  context "when reference points is from activation" do
    let(:point_dist) do
      create(:point_distribution, user: user, order: order,
                                  base_value: 100.0, reference: user_point(user).reference)
    end

    before { described_class.call(point_dist: point_dist) }

    fit "is expected that user point is 30.0 points" do
      expect(user_point(user).reload.amount).to eq(30.0)
    end
  end
end
