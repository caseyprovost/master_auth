# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render json: @user, status: 200, location: user_url(@user)
  end
end
