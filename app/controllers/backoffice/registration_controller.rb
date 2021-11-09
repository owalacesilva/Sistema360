class Backoffice::RegistrationController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
  end
end
