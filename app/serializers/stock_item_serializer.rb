class StockItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :available_date,
            :description, :taxable

  belongs_to :store
end
