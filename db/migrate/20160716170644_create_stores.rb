class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end