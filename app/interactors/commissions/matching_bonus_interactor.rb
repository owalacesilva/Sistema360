class Commissions::MatchingBonusInteractor
  include Interactor

  after do
    context.point_dist.done = true
    context.point_dist.save!
  end

  def call
    ActiveRecord::Base.transaction { run_actions }
  end

  private

  def run_actions
    point_dist = context.point_dist
    nodes_in_path(point_dist.user.node, false, context.depth_level).each_with_index do |node, depth|
      commission = find_commission(node, (depth + 1))
      if commission.present?
        amount = calculate_points_from_base_value(point_dist.base_value, commission.percentage)
        update_and_create_entry_record(node.user, amount, point_dist, commission)
      end
    end
  end

  def find_commission(node, depth)
    Commission.where(type: CommissionType.uname(:team))
      .where(qualification: node.user.qualification)
      .where(depth: depth)
      .first
  end

  def update_and_create_entry_record(user, amount, point_dist, commission)
    user_point = user_point_from_reference(user, point_dist.reference)
    user_point.increment_points!(amount)
    create_user_point_record(user_point, point_dist, commission, amount)
  end

  def user_point_from_reference(user, reference)
    user.points.find_by!(reference: reference)
  rescue ActiveRecord::RecordNotFound
    context.fail!(error: "Não foi possivel encontrar a referencia")
    raise ActiveRecord::Rollback
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

  def nodes_in_path(target, include_self, depth)
    left = include_self ? target.lft + 1 : target.lft
    right = include_self ? target.rgt - 1 : target.rgt
    
    UserNetwork.where(depth: depth..target.depth)
      .where("lft < :lft", lft: left)
      .where("rgt > :rgt", rgt: right)
      .order(depth: :desc)
  end
end
