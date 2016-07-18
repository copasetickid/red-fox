class StockItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price

  belongs_to :store
end
