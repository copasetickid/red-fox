require 'rails_helper'

RSpec.describe "Store Item API", :type => :request do
  let!(:owner) { create(:user) }
  let!(:store) { create(:store, :with_stock_items, user_id: owner.id) }
  let(:item) { create(:stock_item, store_id: store.id)}


  let(:json) { JSON.parse(response.body) }

  context "as an authenticated user " do

    let(:headers) do
      { "HTTP_AUTHORIZATION" => "Token token=#{owner.access_token}" }
    end

    it "displays all the items belongs that bussines owner for all stores" do
      get stock_items_path, headers: headers

      expect(response.content_type).to eq "application/vnd.api+json"

      expect(response.status).to eq 200
      expect(json['data'].length).to eq 2
    end

    it "returns the details of a stock item" do
      get stock_item_path(item), headers: headers

      expect(response.status).to eq 200

      expect(json['data']['id']).to  eq item.id.to_s
      expect(json['data']['attributes']['name']).to eq item.name
    end
  end
end
