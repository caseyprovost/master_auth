# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Authentication", type: :request do
  let(:user) { create(:user).tap { |user| user.confirm } }
  let(:json_response) { JSON.parse(response.body) }
  let(:user_params) do
    {
      email: user.email,
      password: user.password
    }
  end

  context "success" do
    it "returns back an authentication payload" do
      post(user_session_path, params: { user: user_params })
      expect(json_response["email"]).to eq(user.email)
      expect(response.headers["Authorization"]).to include("Bearer ")
    end
  end

  context "failure" do
    it "returns back an error payload" do
      post(user_session_path, params: { user: user_params.slice(:email) })
      expect(json_response["error"]).to eq("Invalid Email or password.")
      expect(response.headers["Authorization"]).to be_blank
    end
  end
end
