class Person < ApplicationRecord

  belongs_to :group, inverse_of: :people, optional: true

  has_many :orders, inverse_of: :person

  validates :email, :name, presence: true
  validates :password, presence: true, confirmation: true

end
