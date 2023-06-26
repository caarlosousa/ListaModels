require 'rails_helper'

RSpec.describe "Api::V1::Feedbacks", type: :request do
  describe "POST /create" do
    let(:post1) {create(:post, title: "Rafael", content: "put fire")}
    let(:feedback_params) do
      attributes_for(:feedback)
    end
    context "when params are ok" do
      it "return http status created" do
        post "/api/v1/posts/#{post1.id}/feedbacks/create", params:{feedback: feedback_params}
        expect(response).to have_http_status(:created)
      end
    end
    context "when params are nil" do
      feedback_params = nil
      it "return https status bad request" do
        post "/api/v1/posts/#{post1.id}/feedbacks/create", params:{feedback: feedback_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "PATCH /update/:id" do
    let(:post1) {create(:post, title: "Cena de filme", content: "Luis Castro na praia")}
    let(:feedback1) {create(:feedback, like: true, post_id: post1.id)}
    let(:feedback_params) do
      attributes_for(:feedback)
    end
    context "when params are ok" do
      it "return http status ok" do
        patch "/api/v1/posts/#{post1.id}/feedbacks/update/#{feedback1.id}", params:{feedback: feedback_params}
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET /show" do
    let(:post1) { create(:post, title: "test", content: "testing") }
    let(:feedback) { create(:feedback, like: true, post_id: post1.id)}

    context "when the feedback exists" do
      it "returns the feedback details" do
        get "/api/v1/posts/#{post1.id}/feedbacks/show/#{feedback.id}"
        expect(response).to have_http_status(:ok)

        feedback_response = JSON.parse(response.body)
        expect(feedback_response["like"]).to eq(true)
      end
    end

    context "when the feedback does not exist" do
      it "returns a not found error" do
        get "/api/v1/posts/#{post1.id}/feedbacks/show/999"
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "DELETE /delete/:id" do
    let(:post1) {create(:post, title: "Junior Santos", content: "Faca no porco")}
    let(:feedback1) {create(:feedback, like: true, post_id: post1.id)}
    context "when feedback exists" do
      it "return https status ok" do
        delete "/api/v1/posts/#{post1.id}/feedbacks/delete/#{feedback1.id}"
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
