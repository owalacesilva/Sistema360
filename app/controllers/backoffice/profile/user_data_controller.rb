class Backoffice::Profile::UserDataController < Backoffice::BackofficeController
  def index
    @user = current_user
  end

  def update
    if find_user.update(user_params)
      flash[:notice] = "Dados atualizados com sucesso"
      redirect_to backoffice_profile_user_data_path
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :birth_date, :person_type,
                                 :rg_number, :cpf_number, :cnpj_number, :phone_number,
                                 :personal_number, :email, :postal_code, :street_address,
                                 :building_number, :neighborhood, :recipient, :state, :city)
  end

  def find_user
    @user = current_user
  end
end
