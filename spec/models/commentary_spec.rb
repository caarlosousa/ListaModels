require 'rails_helper'

RSpec.describe Commentary, type: :model do
  context "Testing factory" do
    it "should create commentary" do
      create(:post, id:1)
      expect(build(:commentary, post_id:1)).to be_valid
    end
  end

  context "Validating commentary" do #Um nome melhor seria "Validating post", porque estamos testando a exitência do post
    it "should be invalid if doesn't exist" do
      expect(build(:commentary, post_id: -1)).to be_invalid
    end
  end
  
  context "Validating content" do
    it "should be invalid if content nil" do
      expect(build(:commentary, content:nil)).to be_invalid
    end
  end
end
