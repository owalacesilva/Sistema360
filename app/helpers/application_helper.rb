module ApplicationHelper

  def presenter(model)
    klass = "#{model.class}Presenter".constantize
    instance = klass.new(model)
    yield(instance) if block_given?
  end

  def currency_formatted(amount)
    return "R$ 0,00" unless valid_float?(amount)

    number_to_currency(amount, locale: :"pt-BR", precision: 2, unit: "R$\s", separetor: ".", delimiter: ",")
  end
end
