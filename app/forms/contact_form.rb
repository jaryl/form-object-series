class ContactForm

  include ActiveModel::Model

  attr_accessor :name, :email, :message

  validates :name, :email, :message, presence: true

  def submit
    return false if invalid?
    # send acknowledgement, and contact us emails, and return true/false
    true
  end

end
