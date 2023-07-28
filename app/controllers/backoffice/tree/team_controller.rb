class Backoffice::Tree::TeamController < Backoffice::BackofficeController

  def index
    @users = current_user
      .sponsored
      .order(created_at: :desc)
      .page(params[:page])
  end
end
