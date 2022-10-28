# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @book = books(:one)
  end

  test 'valid comment' do
    comment = @book.comments.new(content: 'This book is great!')
    comment.user = @user
    assert comment.valid?
  end

  test 'invalid without user' do
    comment = @book.comments.new(content: 'This book is great!')
    assert_not comment.valid?

    comment.user = @user
    assert comment.valid?
  end

  test 'invalid without content' do
    comment = @book.comments.new(user_id: @user.id)
    assert_not comment.valid?

    comment.content = 'This book is great!'
    assert comment.valid?
  end
end
