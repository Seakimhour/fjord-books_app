# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user_one = users(:one)
    @user_two = users(:two)
    @user_two.follow(@user_one)
  end

  test 'valid following user' do
    assert @user_two.following?(@user_one)
  end

  test 'valid followed by user' do
    assert @user_one.followed_by?(@user_two)
  end

  test 'follow a user' do
    @user_one.follow(@user_two)
    assert @user_one.following?(@user_two)
  end

  test 'unfollow a user' do
    @user_two.unfollow(@user_one)
    assert_not @user_one.following?(@user_two)
  end

  test 'should user email' do
    assert_equal @user_one.name_or_email, @user_one.email
  end
end
