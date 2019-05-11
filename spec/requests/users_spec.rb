# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:user) { create(:user).tap { |user| user.confirm } }
  let(:other_user) { create(:user).tap { |user| user.confirm } }
  let(:headers) { auth_headers(default_headers, user) }
  let(:user_params) do
    {
      email: user.email,
      password: user.password
    }
  end

  context "success" do
    it "returns back a user payload" do
      get user_path(user), headers: headers
      expect(json_response["email"]).to eq(user.email)
    end
  end

  context "when the user is not the current user" do
    it "returns back an error payload" do
      get user_path(other_user), headers: headers
      expect(json_response["error"]).to eq("The specified entity does not exist")
    end
  end
end
