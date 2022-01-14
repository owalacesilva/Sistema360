class Backoffice::Store::OrdersController < Backoffice::BackofficeController
  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def destroy
  end
end
