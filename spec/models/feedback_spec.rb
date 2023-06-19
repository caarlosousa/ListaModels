require 'rails_helper'

RSpec.describe Feedback, type: :model do
  context "Testing factory" do
    it "should create feedback" do
      create(:post, id:1)
      expect(build(:feedback, post_id:1)).to be_valid
    end
  end
end
