class Post < ApplicationRecord
    has_many :post_categories, dependent: :destroy
    has_many :feedbacks, dependent: :destroy
    has_many :commentaries, dependent: :destroy

    validates :title, presence: :true 
    validates :content, presence: :true
end
