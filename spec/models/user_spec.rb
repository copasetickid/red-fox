require 'rails_helper'

RSpec.describe User, type: :model do

  describe "callbacks" do
    let(:new_user) { create(:user) }

    it "adds an access token after a user is created" do
      expect(new_user.access_token).not_to be_nil
    end
  end

  describe "associations" do
    it { should have_many(:stores) }
  end
end
