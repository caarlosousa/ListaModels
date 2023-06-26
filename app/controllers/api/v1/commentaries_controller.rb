class Api::V1::CommentariesController < ApplicationController
    def index
        commentaries = Commentary.all
        render json: commentaries, status: :ok
    end

    def create
        post = Post.find(params[:id])
        commentary = post.commentaries.create(commentary_params)
        commentary.save!
        render json: commentary, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def show
        commentary = Commentary.find(params[:id])
        render json: commentary, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def update
        commentary = Commentary.find(params[:id])
        commentary.update!(commentary_params)
        render json: commentary, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    private

    def commentary_params
        params.require(:commentary).permit(:content)
    end
end
