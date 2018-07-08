class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|

      t.string :name
      t.string :email

      t.string :password

      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
