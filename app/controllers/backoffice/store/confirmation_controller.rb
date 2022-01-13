class Backoffice::Store::ConfirmationController < Backoffice::BackofficeController
  def index
    @cart = @current_cart
  end
end
