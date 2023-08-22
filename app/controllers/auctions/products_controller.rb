class Auctions::ProductsController < ApplicationController
  layout 'auctions'

  def index; end

  def show
    @product = Product.find(params[:id])
  end
end
