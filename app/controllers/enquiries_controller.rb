class EnquiriesController < ApplicationController

  def new
    @form = ContactForm.new
  end

  def create
    @form = ContactForm.new(contact_form_params)
    if @form.submit
      redirect_to root_path, notice: 'Thank you for your enquiry'
    else
      render :new
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message)
  end

end
