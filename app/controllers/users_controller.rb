# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    if current_user
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end
end
