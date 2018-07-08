class InvitationsController < ApplicationController

  def new
    @form = UserInvitationForm.new
  end

  def create
    @form = UserInvitationForm.new(user_invitation_form_params)
    if @form.submit
      redirect_to root_path, notice: 'Thank you for your enquiry'
    else
      render :new
    end
  end

  private

  def user_invitation_form_params
    params.require(:user_invitation_form).permit(invitations_attributes: [:name, :email])
  end

end
