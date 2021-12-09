class Backoffice::Store::ProductsController < Backoffice::BackofficeController
  def index
    @products = Product.all
  end

  def show
  end
end
