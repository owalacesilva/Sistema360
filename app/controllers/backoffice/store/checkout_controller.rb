class Backoffice::Store::CheckoutController < Backoffice::BackofficeController
  def index
    @cart = @current_cart
  end
end
