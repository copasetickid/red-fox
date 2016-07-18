class StockItemsController < ApplicationController
  before_action :stock_item_lookup, only: [:show]

  def index
    stock_items = []

    current_user.stores.each do |store|
      store.stock_items.each do |item|
        stock_items << item
      end
    end

    render json: stock_items
  end

  def show
    render json: @stock_item
  end

  private

  def stock_item_lookup
    begin
      @stock_item = StockItem.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: "Wrong ID provided" }, status: 404
    end
  end
end
