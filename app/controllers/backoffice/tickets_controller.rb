class Backoffice::TicketsController < Backoffice::BackofficeController

  def index
    @tickets = current_user.tickets
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
