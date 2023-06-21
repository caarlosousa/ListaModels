class Post < ApplicationRecord
    has_many :post_categories, dependent: :destroy
    has_many :feedbacks, dependent: :destroy
    has_many :commentaries, dependent: :destroy
    # Mesma coisa aqui com a dependência do post_category

    validates :title, presence: :true 
    validates :content, presence: :true
end
