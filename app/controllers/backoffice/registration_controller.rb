class Backoffice::RegistrationController < Backoffice::BackofficeController

  def new
    @user = User.new
  end

  def create
  end
end
