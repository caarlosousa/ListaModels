require 'rails_helper'

RSpec.describe Commentary, type: :model do
  context "Testing factory" do
    it "should create commentary" do
      create(:post, id:1)
      expect(build(:commentary, post_id:1)).to be_valid
    end
  end

  context "Validating commentary" do
    it "should be invalid if doesn't exist" do
      expect(build(:commentary, post_id: -1)).to be_invalid
    end
    it "should be invalid if title nil" do
      expect(build(:commentary, title:nil)).to be_invalid
    end
  end
end
