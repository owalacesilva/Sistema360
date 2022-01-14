class Backoffice::Tree::SponsoredController < Backoffice::BackofficeController

  def index
    @users = current_user.sponsored.order(created_at: :desc)
  end
end
