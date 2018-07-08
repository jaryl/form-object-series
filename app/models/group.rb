class Group < ApplicationRecord

  has_many :people, inverse_of: :group

  validates :name, presence: true

end
