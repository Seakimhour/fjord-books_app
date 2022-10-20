# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @book = books(:one)
  end

  test 'should create comment' do
    assert_difference('Comment.count') do
      post book_comments_url(@book), params: { comment: { content: 'my comment' } }
    end

    assert_redirected_to book_url(@book)
  end
end
