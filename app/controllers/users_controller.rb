# frozen_string_literal: true

class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.order(:id).page(params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if User.exists?(id: params[:id])
      @user = User.find(params[:id])
    else
      redirect_to users_path
    end
  end

  # GET /
  def profile
    if current_user
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end
end
