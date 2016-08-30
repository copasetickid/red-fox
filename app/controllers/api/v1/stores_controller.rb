class API::V1::StoresController < ActionController::API
  before_action :store_lookup, only: [:show]

  def index
    stores = Store.all
    render json: stores
  end

  def show
    render json: @store
  end

  def create
    store = Store.new(store_params)

    if store.save
      render json: store
    else
      render json: { errors: store.errors.full_messages }, status: 422
    end
  end

  private

  def store_lookup
    begin
      @store = Store.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: "Wrong ID provided" }, status: 404
    end
  end

  def store_params
    params.require(:store).permit(:name, :user_id)
  end
end
