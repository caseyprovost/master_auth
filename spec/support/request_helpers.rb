# frozen_string_literal: true

module RequestHelpers
  def json_response
    JSON.parse(response.body)
  end

  def default_headers
    @default_headers ||= {
      "Accept" => "application/json",
      "Content-Type" => "application/json",
    }
  end

  def auth_headers(headers, user)
    Devise::JWT::TestHelpers.auth_headers(headers, user)
  end
end

RSpec.configure do |config|
  config.include RequestHelpers
end
