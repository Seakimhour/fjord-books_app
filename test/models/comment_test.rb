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
    comment = @book.comments.new(content: 'my comment')
    assert_not comment.valid?

    comment.user = @user
    assert comment.valid?
  end

  test 'invalid without content' do
    comment = @book.comments.new(user_id: @user.id)
    assert_not comment.valid?

    comment.content = 'my comment'
    assert comment.valid?
  end
end
