class Category < ApplicationRecord
    has_many :post_categories, dependent: :destroy
    # Sobre o dependent: :destroy -> pode ser que não seja muito bom, porque
    # ao destruir uma ligação da categoria com algum post, você irá destruir toda
    # a categoria e talvez você queira só colocar outra categoria para aquele post.
    # Isso não é obrigatório, mas é só para você saber o que que tá rolando, sabe

    validates :name, presence: :true, uniqueness: :true
    validates :description, presence: :true, uniqueness: :true
end
