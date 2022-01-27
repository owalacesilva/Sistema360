class Backoffice::Profile::PasswordController < Backoffice::BackofficeController
  before_action :prepare_user
  before_action :confirm_current_password, only: [:update]

  def update
    if @user.update(password_params.slice(:password, :password_confirmation))
      redirect_to backoffice_profile_password_path
    else
      render :index
    end
  end

  private

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  def prepare_user
    @user = current_user
  end

  def confirm_current_password
    return if @user.valid_password?(password_params[:current_password])

    @user.errors.add(:password, "Senha inválida") # activerecord.errors.models.user.attributes.password_confirmation.confirmation
    render :index
  end
end
