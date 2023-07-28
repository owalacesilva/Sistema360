class Backoffice::BackofficeController < ApplicationController
  before_action :authenticate_user!
  before_action :current_cart

  private

  def current_cart
    if session[:cart_id]
      cart = Cart.find(session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    if session[:cart_id] == nil
      @current_cart = Cart.create(user: current_user, total: 0)
      session[:cart_id] = @current_cart.id
    end
  end

  def filter_params(filter_name, default: {})
    filter_by_url = request.GET.reject { |field, _| %W(utf8 format commit action controller).include?(field) }

    if filter_by_url.any?
      filters = Filter.new(fields: request.GET)
    else
      unless params[:clear_filter].blank? || session[filter_name].blank?
        filters = Filter.new(fields: session[filter_name])
      else
        filters = Filter.new(fields: default)
      end

      session[filter_name] = filters.to_s
    end

    logger.info { "Filtered: #{filters.fields}" }

    filters
  end
end
