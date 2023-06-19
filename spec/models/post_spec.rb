require 'rails_helper'

RSpec.describe Post, type: :model do
  context "Testing factory" do
  it { expect(build(:post)).to be_valid }
  end

  context "Validating name" do
    it "should be invalid if name nil" do
      expect(build(:post, title:nil)).to be_invalid
    end
  end
end
