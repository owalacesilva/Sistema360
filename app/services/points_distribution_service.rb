class PointsDistributionService
  prepend SimpleCommand

  attr_reader :points_dist

  def initialize(points_dist)
    @points_dist = points_dist
  end

  def call
    ActiveRecord::Base.transaction { run_actions }
  end

  private

  def run_actions
    user_point = user_point_from_reference
    add_user_points(user_point, points_dist.base_value)
    update_service
    create_user_point_record(user_point, Time.zone.today)
  end

  def user_point_from_reference
    reference = points_dist.reference
    points_dist.user.points.find_by!(reference: reference)
  rescue ActiveRecord::RecordNotFound
    errors.add(:errors, "Não foi possivel encontrar a referencia")
    raise ActiveRecord::Rollback
  end

  def add_user_points(user_point, amount)
    user_point.amount += amount
    user_point.save!
    user_point
  end

  def create_user_point_record(user_point, record_date)
    user_point_record = UserPointRecord.new(user: user_point.user, reference: user_point.reference,
      record_date: record_date, amount: user_point.amount)
    user_point_record.save!
    user_point_record
  end

  def update_service
    points_dist.done = true
    points_dist.save!
  end
end
