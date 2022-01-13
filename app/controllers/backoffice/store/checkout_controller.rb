class Backoffice::Store::CheckoutController < Backoffice::BackofficeController
  def index
    @order = Order.new(number: "1", reference_date: Time.zone.now,
      status: :created, user: current_user, billing_address: Address.new,
      shipping_address: Address.new)
    @current_cart.items.each do |item|
      order_item = OrderItem.new(product: item.product, quantity: item.quantity,
        price: item.product.price, cost_price: item.total_price)
      @order.items << order_item
    end
    @order.save!
    @cart = @current_cart
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
  end
end
