require 'rails_helper'

RSpec.describe "Store API", :type => :request do
  let!(:owner) { create(:user) }
  let!(:store) { create(:store) }
  let(:json) { JSON.parse(response.body) }


  context "as an authenticated user" do

    let(:headers) do
      { "HTTP_AUTHORIZATION" => "Token token=#{owner.access_token}" }
    end

    it "displays all the stores" do
      get stores_path, headers: headers

      expect(response.content_type).to eq "application/vnd.api+json"

      expect(response.status).to eq 200
      expect(json['data'].length).to eq 1
    end

    it "returns valid store data" do
      get store_path(store), headers: headers

      expect(response.status).to eq 200

      expect(json['data']['id']).to  eq store.id.to_s
      expect(json['data']['attributes']['name']).to eq store.name
    end

    it "returns an JSON:API error when the requesting store data with invalid params" do
      get store_path(id: "1000"), headers: headers

      expect(response.status).to eq 404
      expect(json['errors']).to eq "Wrong ID provided"
    end
  end
end
