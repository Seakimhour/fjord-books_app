# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    parent.comments.create(comment: params[:comment], user_id: current_user.id)
    redirect_back(fallback_location: root_path, notice: t('comments.create.notice'))
  end

  def destroy
    Comment.find(params[:comment_id]).destroy
    redirect_back(fallback_location: root_path, notice: t('comments.destroy.notice'))
  end

  private

  def parent
    return Book.find params[:book_id] if params[:book_id]

    Report.find params[:report_id] if params[:report_id]
  end
end
