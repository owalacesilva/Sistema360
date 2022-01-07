class WithdrawPresenter < SimpleDelegator

  include ActionView::Helpers::NumberHelper

  def balance_formatted
    return "R$ 0,00" unless valid_float?(balance)

    number_to_currency(balance, locale: :"pt-BR", precision: 2, unit: "R$\s", separetor: ",", delimiter: ".")
  end

  def created_at_formatted
    created_at.strftime("%d/%m/%Y")
  end

  def bank_account
    wallet.user.bank_account
  end
end
