require 'rails_helper'

RSpec.describe "Potepan::Samples", type: :request do
  describe "#index" do
    it "returns 200 response" do
      get "/potepan/index"
      expect(response).to have_http_status(200)
    end
  end
end
