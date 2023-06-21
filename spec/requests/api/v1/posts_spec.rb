require 'rails_helper'

RSpec.describe "Api::V1::Posts", type: :request do
  describe "POST /create" do
    let(:post_params) do
      attributes_for(:post)
    end
  end
end
