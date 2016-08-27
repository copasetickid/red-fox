class API::V1::StockItemsController < ActionController::API
  before_action :stock_item_lookup

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
