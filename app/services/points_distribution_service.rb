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
    f(points_dist, points_dist.user)
    nodes = nodes_in_path(points_dist.user.node, false, 0)
    nodes.each { |node| f(points_dist, node.user) }
    update_service
  end
  
  def f(points_dist, user)
    user_point = user_point_from_reference(user, points_dist.reference)
    amount = calculate_points(points_dist.base_value)
    update_user_points(user_point, amount)
    create_user_point_record(user_point, points_dist.user, points_dist.base_value, amount)
  end

  def user_point_from_reference(user, reference)
    user.points.find_by!(reference: reference)
  rescue ActiveRecord::RecordNotFound
    errors.add(:errors, "Não foi possivel encontrar a referencia")
    raise ActiveRecord::Rollback
  end

  def update_user_points(user_point, amount)
    user_point.amount += amount
    user_point.save!
  end

  def create_user_point_record(user_point, origin_user, base_value, amount)
    user_point_record = UserPointRecord.new(user: user_point.user, origin_user: origin_user,
                                            reference: user_point.reference, record_date: Time.zone.today,
                                            base_value: base_value, amount: amount)
    user_point_record.save!
    user_point_record
  end

  def update_service
    points_dist.done = true
    points_dist.save!
  end

  def calculate_points(base_value)
    percentage = percentage_from_qualification
    ((base_value / 100) * percentage)
  end

  def percentage_from_qualification
    BigDecimal("30.0")
  end

  def nodes_in_path(target, include_self, depth)
    left = include_self ? target.lft + 1 : target.lft
    right = include_self ? target.rgt - 1 : target.rgt
    
    UserNetwork.where(depth: depth..target.depth)
      .where("lft < :lft", lft: left)
      .where("rgt > :rgt", rgt: right)
      .order(depth: :desc)
  end
end
