class Backoffice::Profile::BankingAccountController < Backoffice::BackofficeController
  before_action :prepare_user_banking

  def update
    if assign_params_to_user_banking.save
      redirect_to backoffice_profile_banking_account_path
    else
      render :index
    end
  end

  private

  def banking_params
    params.require(:banking).permit(:bank_code, :account_type, :branch_number, :branch_code,
                                    :account_code, :account_number, :operation, :holder_name,
                                    :document_number)
  end

  def prepare_user_banking
    @user_bank = current_user.banking_account
  end

  def assign_params_to_user_banking
    @user_bank.assign_attributes(banking_params)
    @user_bank
  end
end
