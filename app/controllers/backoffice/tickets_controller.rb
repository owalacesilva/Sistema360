class Backoffice::TicketsController < Backoffice::BackofficeController

  def index
    @tickets = current_user.tickets
  end

  def show
  end

  def new
  end

  def create
    ticket = current_user.tickets.build(ticket_params)
    if ticket.save
      redirect_to backoffice_tickets_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def ticket_params
    params.require(:ticket).permit(%i[subject message department priority])
  end
end
