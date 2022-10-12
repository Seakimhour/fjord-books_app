# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followers
    @followers = User.find(params[:id]).followers.with_attached_avatar.order(:id).page(params[:page])
  end

  def followings
    @followings = User.find(params[:id]).followings.with_attached_avatar.order(:id).page(params[:page])
  end

  def follow
    current_user.following_follows.create!(following_id: params[:id])
    redirect_back(fallback_location: users_path, notice: t('controllers.common.notice_follow'))
  end

  def unfollow
    current_user.following_follows.find_by!(following_id: params[:id]).destroy
    redirect_back(fallback_location: users_path, notice: t('controllers.common.notice_unfollow'))
  end
end
