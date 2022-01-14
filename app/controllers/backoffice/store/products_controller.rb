class Backoffice::Store::ProductsController < Backoffice::BackofficeController
  def index
    @products = Product.all.order(title: :asc)
    @categories = ProductCategory.all.order(display_name: :desc)
    @cart = @current_cart
  end

  def show
  end
end
