class Invitation

  include ActiveModel::Model

  attr_accessor :name, :email

  validates :name, :email, presence: true
  validate :user_already_registered

  private

  def user_already_registered
    errors.add(email: 'already registered') if Person.exists?(email: email)
  end

end
