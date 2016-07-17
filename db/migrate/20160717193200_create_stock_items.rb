class CreateStockItems < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_items do |t|
      t.string :name
      t.text  :description
      t.decimal :price
      t.datetime :available_date
      t.boolean :taxable

      t.references :store, index: true

      t.timestamps
    end
  end
end
