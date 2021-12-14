require "rails_helper"

def user_point(user)
  user.points.first
end

RSpec.describe PointsDistributionService do
  let(:user) { create(:user) }
  let(:order) { create(:order_complete, user: user) }
  let(:reference) { create(:reference) }

  context "with valid parameters" do
    let!(:service) { described_class.call(point_dist) }
    let(:point_dist) { create(:point_distribution, user: user, order: order, reference: user_point(user).reference) }

    it { expect(service).to be_success }
    it { expect(service.result).to be_an_instance_of(UserPointRecord) }

    it "is expected point dist to be done" do
      expect(point_dist.done).to eq(true)
    end

    it "is expected that user point have the same base value" do
      expect(user_point(user).reload.amount).to eq(point_dist.base_value)
    end
  end

  context "without valid reference" do
    let!(:service) { described_class.call(point_dist) }
    let(:point_dist) { create(:point_distribution, user: user, order: order, reference: reference) }

    it { expect(service).not_to be_success }
    it { expect(service.result).to be_nil }
    it { expect(service.errors).to eq({ errors: ["Não foi possivel encontrar a referencia"] }) }

    it "does not change point_dist object" do
      expect(point_dist.done).to be_falsey
    end

    it "does not increment user point" do
      expect(user_point(user).reload.amount).to eq(0)
    end
  end
end
