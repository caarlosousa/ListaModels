require 'rails_helper'

RSpec.describe Category, type: :model do
  context "Testing factory" do
    it {expect(build(:category)).to be_valid} 
  end

  context "Validating name" do
    it "should be invalid if name nil" do
      expect(build(:category, name:nil)).to be_invalid
    end
    it "should be invalid if repetead" do
      create(:category, name: "test")
      expect(build(:category, name: "test")).to be_invalid
    end
  end
end
