class Post < ApplicationRecord
    has_many :posts, dependent: :destroy

    validates :title, presence: :true, :content, presence: :true
end
