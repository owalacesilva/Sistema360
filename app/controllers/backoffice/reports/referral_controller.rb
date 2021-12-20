class Backoffice::Reports::ReferralController < Backoffice::BackofficeController

  def index
    @point = current_user.point(:activation)
    @records = current_user.point_records
  end
end
