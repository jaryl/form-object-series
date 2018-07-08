class Order < ApplicationRecord

  belongs_to :person, inverse_of: :orders

  has_many :line_items, inverse_of: :order

  validates :order_no, :shipping_address, presence: true

  before_validation :calculate_grand_total

  accepts_nested_attributes_for :line_items

  private

  def calculate_grand_total
    self.grand_total = line_items.map(&:sub_total).reject(&:blank?).sum
  end

end
