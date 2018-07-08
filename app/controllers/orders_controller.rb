class OrdersController < ApplicationController

  before_action :prepare_person

  def new
    @form = OrderForm.new(@person)
  end

  def create
    @form = OrderForm.new(@person, order_form_params)
    if @form.submit
      redirect_to root_path, notice: 'Thank you for your order'
    else
      render :new
    end
  end

  private

  def prepare_person
    @person = Person.first # this is just an example, ideally you'd use the current_user or something
  end

  def order_form_params
    params.require(:order_form).permit(
      :sign_up_for_newsletter,
      :billing_address,
      :shipping_address,
      :shipping_same_as_billing_address,
      line_items_attributes: [:description, :quantity, :unit_price]
    )
  end

end
