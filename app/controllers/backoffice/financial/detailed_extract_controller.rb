class Backoffice::Financial::DetailedExtractController < Backoffice::BackofficeController

  def index
    @records = current_user.wallet.income_transactions
  end
end
