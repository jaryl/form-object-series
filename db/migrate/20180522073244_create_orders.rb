class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|

      t.references :person, foreign_key: true

      t.string :order_no

      t.string :shipping_address
      t.string :billing_address

      t.decimal :grand_total

      t.timestamps
    end
  end
end
