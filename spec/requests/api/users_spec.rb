require 'rails_helper'

RSpec.describe "User API", :type => :request do
  let!(:user) { create(:user) }


  it "displays all the users" do
    get users_path

    json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(json['data'].length).to eq 1


  end

  it "returns valid user data" do
    get user_path(user)

    json = JSON.parse(response.body)

    expect(response.status).to eq 200

    expect(json['data']['id']).to  eq user.id.to_s
    expect(json['data']['attributes']['email']).to eq user.email
  end
end
