class Backoffice::Tree::TeamController < Backoffice::BackofficeController

  def index
    @users = current_user.sponsors
  end
end
