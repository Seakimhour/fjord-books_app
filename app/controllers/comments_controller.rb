# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]
  before_action :owner_validate, only: %i[destroy]

  def create
    @comment = @commentable.comments.new(comment: params[:comment], user_id: current_user.id)
    if @comment.save
      redirect_back(fallback_location: root_path, notice: t('comments.destroy.notice'))
    else
      redirect_back(fallback_location: root_path, flash: { errors: @comment.errors.full_messages })
    end
  end

  def destroy
    @comment.destroy
    redirect_back(fallback_location: root_path, notice: t('comments.destroy.notice'))
  end

  private

  def owner_validate
    redirect_back(fallback_location: root_path, alert: t('errors.messages.forbidden')) if current_user != @comment.user
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
