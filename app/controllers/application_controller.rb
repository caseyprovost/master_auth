# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  before_action :authenticate_user!
  respond_to :json

  private

  def render_404
    render json: { error: "The specified entity does not exist" }, status: 404
  end
end
