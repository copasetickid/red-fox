require 'rails_helper'

RSpec.describe "User API", :type => :request do
  let!(:user) { create(:user) }
  let(:json) { JSON.parse(response.body) }

   context "as an authenticated user" do

    let(:headers) do
      { "HTTP_AUTHORIZATION" => "Token token=#{user.access_token}" }
    end

    it "displays all the users" do
      get users_path, headers: headers

      expect(response.content_type).to eq "application/vnd.api+json"

      expect(response.status).to eq 200
      expect(json['data'].length).to eq 1
    end

    it "returns valid user data" do
      get user_path(user), headers: headers

      expect(response.status).to eq 200

      expect(json['data']['id']).to  eq user.id.to_s
      expect(json['data']['attributes']['email']).to eq user.email
    end

    it "returns an JSON:API error when the requesting user data with invalid" do
      get user_path(id: "5"), headers: headers

      expect(response.status).to eq 404
      expect(json['errors']).to eq "Wrong ID provided"
    end
  end
end
