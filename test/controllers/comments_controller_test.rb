# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:allison)
    @the_followship_of_the_ring = books(:the_followship_of_the_ring)
  end

  test 'should create comment' do
    assert_difference('Comment.count') do
      post book_comments_url(@the_followship_of_the_ring), params: { comment: { content: 'my comment' } }
    end

    assert_redirected_to book_url(@the_followship_of_the_ring)
  end
end
