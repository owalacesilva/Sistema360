class Commissions::InitialInteractor
  include Interactor

  before do
    context.user_point_records = []
  end

  def call
    ActiveRecord::Base.transaction { run_actions }
  end

  private

  def run_actions
    point_dist = context.point_dist
    user_point = user_point_from_reference(point_dist.user, point_dist.reference)
    commission = find_commission
    amount = calculate_points_from_base_value(point_dist.base_value, commission.percentage)
    update_user_points(user_point, amount)
    create_user_point_record(user_point, point_dist, find_commission, amount)
  end

  def find_commission
    Commission.where(type: CommissionType.uname(:referral)).first
  end

  def user_point_from_reference(user, reference)
    user.points.find_by!(reference: reference)
  rescue ActiveRecord::RecordNotFound
    context.fail!(error: "Não foi possivel encontrar a referencia")
    raise ActiveRecord::Rollback
  end

  def update_user_points(user_point, amount)
    user_point.amount += amount
    user_point.save!
  end

  def create_user_point_record(user_point, point_dist, commission, amount)
    user_point_record = UserPointRecord.new(user: user_point.user, origin_user: point_dist.user,
                                            reference: user_point.reference, commission: commission, 
                                            record_date: Time.zone.today, point_distribution: point_dist,
                                            base_value: point_dist.base_value, amount: amount)
    user_point_record.save!
    context.user_point_records << user_point_record
  end

  def calculate_points_from_base_value(base_value, percentage)
    ((base_value / 100) * percentage)
  end
end
