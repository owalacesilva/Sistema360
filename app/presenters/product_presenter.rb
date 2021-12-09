class ProductPresenter < SimpleDelegator

  include ActionView::Helpers::NumberHelper

  def price_formatted
    return "R$ 0,00" unless valid_float?(price)

    number_to_currency(price, locale: :"pt-BR", precision: 2, unit: "R$\s", separetor: ",", delimiter: ".")
  end

  def point_amount_formatted
    return "R$ 0,00" unless valid_float?(point_amount)

    number_to_currency(point_amount, locale: :"pt-BR", precision: 2, unit: "Pts", separetor: ",", delimiter: ".", 
      format: "%n %u")
  end
end
