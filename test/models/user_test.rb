# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @allison = users(:allison)
    @hansen = users(:hansen)
    @eriobu = users(:eriobu)
  end

  test 'valid following user' do
    assert_not @allison.following?(@hansen)

    @allison.follow(@hansen)

    assert @allison.following?(@hansen)
  end

  test 'invalid following user' do
    assert_not @allison.following?(@hansen)
  end

  test 'valid followed by user' do
    assert_not @hansen.followed_by?(@allison)

    @allison.follow(@hansen)

    assert @hansen.followed_by?(@allison)
  end

  test 'invalid followed by user' do
    assert_not @hansen.followed_by?(@allison)
  end

  test 'follow a user' do
    assert_not @allison.following?(@hansen)

    @allison.follow(@hansen)
    assert @allison.following?(@hansen)
  end

  test 'unfollow a user' do
    @allison.follow(@hansen)
    assert @allison.following?(@hansen)

    @allison.unfollow(@hansen)
    assert_not @allison.following?(@hansen)
  end

  test 'should return name if name exist' do
    assert_equal 'Eriobu', @eriobu.name_or_email
  end

  test 'should return email if name not exist' do
    assert_equal 'allison@example.com', @allison.name_or_email
  end
end
