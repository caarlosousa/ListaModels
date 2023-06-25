class Api::V1::PostsController < ApplicationController
    def create
        post = Post.new(post_params)
        post.save!
        render json: post, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def show
        post = Post.find(params[:id])
        render json: post, status: :ok
      rescue ActiveRecord::RecordNotFound => e
        render json: e, status: :not_found
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :useradmin_id)
    end
end
