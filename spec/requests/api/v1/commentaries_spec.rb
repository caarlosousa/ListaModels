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
end
