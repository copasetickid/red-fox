require 'rails_helper'

RSpec.describe "V1: Store Endpoint", :type => :request do
  let(:json) { JSON.parse(response.body) }


    context "when stores exists " do
      before do
        create_list(:store, 3)
      end

      it "returns all the data for all stores" do
        get  api_v1_stores_path

        expect(response.content_type).to eq "application/vnd.api+json"
        expect(response.status).to eq 200
        expect(json['data'].length).to eq 3
      end
    end

    context "requesting information for an indivdual store" do

      let(:store) { create(:store) }

      it "returns valid store data" do
        get api_v1_store_path(store)

        expect(response.status).to eq 200

        expect(json['data']['id']).to  eq store.id.to_s
        expect(json['data']['attributes']['name']).to eq store.name
      end

      it "returns an JSON:API error when the requesting store data with invalid params" do
        get api_v1_store_path(id: "1000")

        expect(response.status).to eq 404
        expect(json['errors']).to eq "Wrong ID provided"
      end
    end

end
