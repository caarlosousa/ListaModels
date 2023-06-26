class Api::V1::FeedbacksController < ApplicationController
    def index
        feedbacks = Feedback.all
        render json: feedbacks, status: :ok
    end

    def create
        post = Post.find(params[:id])
        feedback = post.feedbacks.create(feedback_params)
        feedback.save!
        render json: feedback, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private

    def feedback_params
        params.require(:feedback).permit(:like)
    end
end
