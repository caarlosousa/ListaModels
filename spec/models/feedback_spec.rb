require 'rails_helper'

RSpec.describe Feedback, type: :model do
  context "Testing factory" do
    it "should create feedback" do
      create(:post, id:1)
      expect(build(:feedback, post_id:1)).to be_valid
    end
  end

  context "Validating feedback" do
    it "should be invalid if doesn't exist" do
      expect(build(:feedback, post_id: -1)).to be_invalid
    end
  end

  context "testing like" do
    it "should be invalid if like is not bool" do
      create(:post, id: 1)
      expect(build(:feedback, post_id: 1, like: nil)).to be_invalid
    end
  end
end
