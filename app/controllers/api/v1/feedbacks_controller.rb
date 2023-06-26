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

    def show
        feedback = Feedback.find(params[:id])
        render json: feedback, status: :ok
      rescue StandardError => e
        render json: e, status: :not_found
      end

    def update
        feedback = Feedback.find(params[:id])
        feedback.update!(feedback_params)
        render json: feedback, status: :ok
    rescue StandardError => e
        render json> e, status: :not_found
    end

    def delete
        feedback = Feedback.find(params[:id])
        feedback.destroy!
        render json: {message: "Destroyed object."}, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    private

    def feedback_params
        params.require(:feedback).permit(:like)
    end
end
