class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|

      t.references :order, foreign_key: true

      t.string :description

      t.integer :quantity
      t.decimal :unit_price
      t.decimal :sub_total

      t.timestamps
    end
  end
end
