class OrderPresenter < SimpleDelegator

  include ActionView::Helpers::NumberHelper

  def total_formatted
    return "R$ 0,00" unless valid_float?(total)

    number_to_currency(total, locale: :"pt-BR", precision: 2, unit: "R$\s", separetor: ",", delimiter: ".")
  end

  def reference_date_formatted
    reference_date.strftime("%d/%m/%Y")
  end

  def status_formatted
    status
  end
end
