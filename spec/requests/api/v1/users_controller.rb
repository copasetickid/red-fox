require 'rails_helper'

RSpec.describe "V1 Users API", :type => :request do
  let!(:users) { create_list(:user, 3) }



  let(:json) { JSON.parse(response.body) }

  context "when request the information for users" do

    it "returns a collection of all users that  exists" do
      get api_v1_users_path

      expect(response.status).to eq 200

      expect(json['data'].length).to  eq 3
    end

  end
end
