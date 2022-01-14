class Backoffice::Financial::DetailedExtractController < Backoffice::BackofficeController

  def index
    @records = current_user.wallet.income_transactions.order(created_at: :desc)
  end
end
