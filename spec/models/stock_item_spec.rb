require 'rails_helper'

RSpec.describe StockItem, type: :model do

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
  end

  describe "associations" do
    it { should belong_to(:store) }
  end
end
