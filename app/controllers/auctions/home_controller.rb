class Auctions::HomeController < ApplicationController
  layout 'auctions'

  def index
    @featured_product = Product.last
    @products = Product.all.order(title: :asc)
  end
end
