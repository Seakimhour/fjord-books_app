# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @book = books(:one)
  end

  test 'valid comment' do
    comment = @book.comments.new(content: 'my comment')
    comment.user = @user
    assert comment.valid?
  end

  test 'invalid without user' do
    comment = Comment.new(content: 'my comment')
    refute comment.valid?
  end

  test 'invalid without content' do
    comment = Comment.new(user_id: @user.id)
    refute comment.valid?
  end
end
