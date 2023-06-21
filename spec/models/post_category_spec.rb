require 'rails_helper'

RSpec.describe PostCategory, type: :model do
  let(:category) { create(:category) }
  let(:post) { create(:post) }
  
  context "Testing factory" do
    it "should create postcategory" do
      expect(build(:post_category, post_id:post.id, category_id:category.id)).to be_valid
    end
  end
  # É interessante testar para um id de categoria nula e para um id de post nulo. Tipo assim:
  context 'Testing category' do
    it 'should be invalid if nil' do
      expect(build(:post_category, category: nil, post_id: post.id)).to be_invalid
    end

    it 'should be invalid if id does not exists' do
      expect(build(:post_category, category_id: -1, post_id: post.id)).to be_invalid
    end
  end
end
