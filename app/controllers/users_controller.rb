# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    render json: user, status: 200, location: user_url(user)
  end

  private

  def user
    return @user if @user
    @user = User.find(params[:id])

    if @user.id != current_user.id
      raise ActiveRecord::RecordNotFound
    end

    @user
  end
end
