class UserPointRecordPresenter < SimpleDelegator

  include ActionView::Helpers::NumberHelper

  def base_point_amount_formatted
    return "0.00 Pts" unless valid_float?(base_value)

    number_to_currency(base_value, locale: :"pt-BR", precision: 2, unit: "Pts", separetor: ",", delimiter: ".", 
      format: "%n %u")
  end

  def point_amount_formatted
    return "0.00 Pts" unless valid_float?(amount)

    number_to_currency(amount, locale: :"pt-BR", precision: 2, unit: "Pts", separetor: ",", delimiter: ".", 
      format: "%n %u")
  end

  def created_at_formatted
    created_at.strftime("%d/%m/%Y")
  end

  def record_date_formatted
    record_date.strftime("%d/%m/%Y")
  end

  def commission_name
    commission.display_name
  end

  def reference_name
    reference.display_name
  end

  def commission_percentage
    "#{commission.percentage}%" unless commission.percentage.nil?
  end
end
