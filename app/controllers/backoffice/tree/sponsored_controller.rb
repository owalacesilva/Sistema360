class Backoffice::Tree::SponsoredController < Backoffice::BackofficeController

  def index
    @users = current_user.sponsors
  end
end
