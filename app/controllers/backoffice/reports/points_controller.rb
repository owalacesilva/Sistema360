class Backoffice::Reports::PointsController < Backoffice::BackofficeController

  def index
    @filters = filter_params('points_report')
    query = PointsReportQuery.call(relation: current_user, filters: @filters)
    @point = current_user.point(:activation)
    @records = query.order(created_at: :desc).page(params[:page]).per(10)
  end
end
