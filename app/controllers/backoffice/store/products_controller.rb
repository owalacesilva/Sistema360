class Backoffice::Store::ProductsController < Backoffice::BackofficeController
  def index
    @products = Product.all
    @categories = ProductCategory.all
    @cart = @current_cart
  end

  def show
  end
end
