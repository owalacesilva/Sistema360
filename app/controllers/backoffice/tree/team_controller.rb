class Backoffice::Tree::TeamController < Backoffice::BackofficeController

  def index
    @filters = filter_params('team')
    query = TeamQuery.call(relation: current_user, filters: @filters)
    @users = query.order(created_at: :desc).page(params[:page])
  end
end
