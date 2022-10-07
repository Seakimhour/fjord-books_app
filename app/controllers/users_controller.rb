# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])

    @users.each do |user|
      current_user.followings.each do |follow|
        user.followed = true if user == follow
      end
    end
  end

  def show
    @user = User.find(params[:id])

    current_user.followings.each do |follow|
      @user.followed = true if @user == follow
    end
  end

  def followers
    @followers = User.find(params[:id]).followers.with_attached_avatar.order(:id).page(params[:page])
  end

  def followings
    @followings = User.find(params[:id]).followings.with_attached_avatar.order(:id).page(params[:page])
  end

  def follow
    Follow.create(follower_id: current_user.id, following_id: params[:id])
    redirect_back(fallback_location: users_path, notice: t('controllers.common.notice_follow'))
  end

  def unfollow
    Follow.find_by(follower_id: current_user.id, following_id: params[:id]).destroy
    redirect_back(fallback_location: users_path, notice: t('controllers.common.notice_unfollow'))
  end
end
