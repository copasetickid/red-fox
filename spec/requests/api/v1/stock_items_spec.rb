require 'rails_helper'

RSpec.describe "V1 Stock Items API", :type => :request do
  let!(:owner) { create(:user) }
  let!(:store) { create(:store, :with_stock_items, user_id: owner.id) }
  let(:item) { create(:stock_item, store_id: store.id)}


  let(:json) { JSON.parse(response.body) }

  context "when request the information for a stock item" do

    it "returns the details of a stock item when it exists" do
      get api_v1_stock_item_path(item)

      expect(response.status).to eq 200

      expect(json['data']['id']).to  eq item.id.to_s
      expect(json['data']['attributes']['name']).to eq item.name
    end

    it "returns an error when the stock item does not exist" do
      get api_v1_stock_item_path(id: "1000")

      expect(response.status).to eq 404
      expect(json['errors']).to eq "Wrong ID provided"
    end
  end
end
