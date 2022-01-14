class TicketPresenter < SimpleDelegator

  include ActionView::Helpers::NumberHelper

  def created_at_formatted
    created_at.strftime("%d/%m/%Y ás %H:%M")
  end

  def status_formatted
    status
  end
end
