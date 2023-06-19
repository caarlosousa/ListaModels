class Post < ApplicationRecord
    has_many :posts, dependent: :destroy

    validates :title, presence: :true 
    validates :content, presence: :true
end
