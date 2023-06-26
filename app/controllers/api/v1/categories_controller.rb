class Api::V1::CategoriesController < ApplicationController
    def index
        categories = Category.all
        render json: categories, status: :ok
    end

    def create
        category = Category.new(category_params)
        category.save!
        render json: category, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def show
        category = Category.find(params[:id])
        render json: category, status: :ok
    rescue ActiveRecord::RecordNotFound => e
        render json: e, status: :not_found
    end

    private

    def category_params
        params.require(:category).permit(:name, :description)
    end
end
