class LineItem < ApplicationRecord

  belongs_to :order, inverse_of: :line_items

  validates :description, :quantity, :unit_price, :sub_total, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, :sub_total, numericality: { greater_than: 0 }

  before_validation :calculate_sub_total

  private

  def calculate_sub_total
    return if quantity.blank? || unit_price.blank?
    self.sub_total = quantity * unit_price
  end

end
