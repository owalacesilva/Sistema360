class Backoffice::Financial::WithdrawController < Backoffice::BackofficeController
  skip_before_action :verify_authenticity_token

  def index
    @records = wallet.withdraws.order(created_at: :desc)
  end

  def create
    withdraw = Withdraw.new(wallet: wallet, balance: params[:value])
    withdraw.save!
    render json: { success: true }
  end

  private

  def wallet
    current_user.wallet
  end
end
