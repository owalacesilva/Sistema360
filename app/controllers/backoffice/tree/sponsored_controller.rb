class Backoffice::Tree::SponsoredController < Backoffice::BackofficeController

  def index
    @filters = filter_params('sponsored')
    query = SponsoredQuery.call(relation: current_user, filters: @filters)
    @users = query.order(created_at: :desc).page(params[:page])
  end
end
