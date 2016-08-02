class StoreStockItemsController < ApplicationController
  before_action :store_lookup

  def create
    @stock_item = @store.stock_item.new

    @stock_item.attributes = stock_item_params

    if @stock_item.save
      render json: @stock_item
    else
      render json: { errors: @stock_item.errors.full_messages }
    end
  end

  private

  def store_lookup
    begin
      @store = Store.find(params[:store_id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: "Wrong ID provided" }, status: 404
    end
  end


  def stock_item_params
    params.require(:stock_item).permit(:name, :description, :price, :available_date, :taxable)
  end
end
