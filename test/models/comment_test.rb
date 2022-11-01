# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @allison = users(:allison)
    @the_followship_of_the_ring = books(:the_followship_of_the_ring)
  end

  test 'valid comment' do
    comment = @the_followship_of_the_ring.comments.new(content: 'This book is great!')
    comment.user = @allison
    assert comment.valid?
  end

  test 'invalid without user' do
    comment = @the_followship_of_the_ring.comments.new(content: 'This book is great!')
    assert_not comment.valid?

    comment.user = @allison
    assert comment.valid?
  end

  test 'invalid without content' do
    comment = @the_followship_of_the_ring.comments.new(user_id: @allison.id)
    assert_not comment.valid?

    comment.content = 'This book is great!'
    assert comment.valid?
  end
end
