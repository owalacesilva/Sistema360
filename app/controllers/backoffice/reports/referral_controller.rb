class Backoffice::Reports::ReferralController < Backoffice::BackofficeController

  def index
    @point = current_user.point("Ativação")
    @records = current_user.point_records
  end
end
