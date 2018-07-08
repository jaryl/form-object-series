class OrderForm

  include ActiveModel::Model

  attr_accessor :shipping_address, :billing_address, :shipping_same_as_billing_address, :line_items_attributes

  attr_reader :person, :order, :shipping_same_as_billing_address

  delegate :line_items, to: :order

  validates :shipping_address, presence: true
  validates :billing_address, presence: true, unless: :shipping_same_as_billing_address?

  validate :order_is_valid, :line_items_are_valid

  def initialize(person, params = {})
    @person = person
    @shipping_same_as_billing_address = true
    @order = @person.orders.build
    @line_items = [LineItem.new] if order.line_items.empty?
    super(params)
  end

  def submit
    @order.attributes = order_params
    return false if invalid?
    @order.save
    true
  end

  def shipping_same_as_billing_address=(value)
    @shipping_same_as_billing_address = ActiveModel::Type::Boolean.new.cast(value)
  end

  def shipping_same_as_billing_address?
    @shipping_same_as_billing_address
  end

  private

  def order_params
    {
      order_no: 'some-generated-number',
      shipping_address: shipping_address,
      billing_address: billing_address,
      line_items_attributes: line_items_attributes
    }
  end

  def order_is_valid
    errors.add(:order, 'is invalid') if order.invalid?
  end

  def line_items_are_valid
    errors.add(:line_items, 'are invalid') if line_items.any?(&:invalid?)
  end

end
