class Admin::UsersController < ApplicationController

  def index
    @form = Admin::UserSearchForm.new(admin_user_search_form_params)
    @form.submit if params[:admin_user_search_form].present?
  end

  private

  def admin_user_search_form_params
    params.fetch(:admin_user_search_form, {}).permit(:term, :status, :group)
  end

end
