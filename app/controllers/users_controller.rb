class UsersController < ApplicationController

  def new
    @form = UserRegistrationForm.new
  end

  def create
    @form = UserRegistrationForm.new(user_registration_form_params)
    if @form.submit
      redirect_to root_path, notice: 'Thank you for your registration'
    else
      render :new
    end
  end

  private

  def user_registration_form_params
    params.require(:user_registration_form).permit(:terms_of_service, person_attributes: [:name, :email, :password, :password_confirmation])
  end

end
