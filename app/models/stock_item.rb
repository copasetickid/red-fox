class StockItem < ApplicationRecord

  validates :name, :price, presence: true

  belongs_to :store
end
