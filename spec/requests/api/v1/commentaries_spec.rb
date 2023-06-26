require 'rails_helper'

RSpec.describe "Api::V1::Commentaries", type: :request do
  describe "POST /create" do
    let(:post1) {create(:post, title: "Rafael", content: "put fire")}
    let(:commentary_params) do
      attributes_for(:commentary)
    end
    context "when params are ok" do
      it "return http status created" do
        post "/api/v1/posts/#{post1.id}/commentaries/create", params:{commentary: commentary_params}
        expect(response).to have_http_status(:created)
      end
    end
    context "when params are nil" do
      commentary_params = nil
      it "return https status bad request" do
        post "/api/v1/posts/#{post1.id}/commentaries/create", params:{commentary: commentary_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "GET /show" do
    let(:post1) {create(:post, title: "test", content: "testing")}
    let(:commentary) { create(:commentary, content: "test", post_id: post1.id)}

    context "when the commentary exists" do
      it "returns the commentary details" do
        get "/api/v1/posts/#{post1.id}/commentaries/show/#{commentary.id}"
        expect(response).to have_http_status(:ok)

        commentary_response = JSON.parse(response.body)
        expect(commentary_response["content"]).to eq("test")
      end
    end

    context "when the commentary does not exist" do
      it "returns a not found error" do
        get "/api/v1/posts/#{post1.id}/commentaries/show/999"
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "PATCH /update/:id" do
    let(:post1) {create(:post, title: "Cena de filme", content: "Luis Castro na praia")}
    let(:commentary1) {create(:commentary, content: "comentario", post_id: post1.id)}
    let(:commentary_params) do
      attributes_for(:commentary)
    end
    context "when params are ok" do
      it "return http status ok" do
        patch "/api/v1/posts/#{post1.id}/commentaries/update/#{commentary1.id}", params:{commentary: commentary_params}
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "DELETE /delete/:id" do
    let(:post1) {create(:post, title: "Junior Santos", content: "Faca no porco")}
    let(:commentary1) {create(:commentary, content: "comentario", post_id: post1.id)}
    context "when commentary exists" do
      it "return https status ok" do
        delete "/api/v1/posts/#{post1.id}/commentaries/delete/#{commentary1.id}"
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
