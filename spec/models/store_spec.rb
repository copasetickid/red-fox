require 'rails_helper'

RSpec.describe Store, type: :model do

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:stock_items) }
  end
end
