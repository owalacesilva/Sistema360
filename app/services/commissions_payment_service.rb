class CommissionsPaymentService
  prepend SimpleCommand

  attr_reader :user, :transactions, :total_amount

  def initialize(user)
    @user = user
    @transactions = []
    @total_amount = 0.0
  end

  def call
    ActiveRecord::Base.transaction { actions }
  rescue StandardError => e
    errors.add(:errors, e.message)
  end

  private

  def actions
    valid_user?
    create_transactions
    add_wallet_balance
    reset_user_points
    response
  end

  def valid_user?
    raise "User invalid" if @user.blank?
  end

  def create_transactions
    @user.points.each do |user_point|
      @transactions << Transaction.create!(transaction_params(user_point))
    end
  end

  def add_wallet_balance
    @total_amount = @transactions.sum(&:amount)
    @user.wallet.balance = @total_amount
  end

  def reset_user_points
    @user.points.each do |user_point|
      user_point.amount = 0
      user_point.save!
    end
  end

  def transaction_params(user_point)
    { origin_user: @user, target_user: @user,
      target_wallet: @user.wallet, origin_wallet: @user.wallet,
      reference: user_point.reference, description: "Comissão #{user_point.reference.display_name}",
      operation: Transaction.operations[:income], amount: user_point.amount,
      percentage: 100, point_amount: user_point.amount }
  end

  def response
    { transactions: @transactions, total_amount: @total_amount }
  end
end
