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
    context "when feedback exists" do
      it "return http status ok" do
        patch "/api/v1/posts/#{post1.id}/feedbacks/update/#{feedback1.id}", params:{feedback: feedback_params}
        expect(response).to have_http_status(:ok)
      end
    end
  end

end
