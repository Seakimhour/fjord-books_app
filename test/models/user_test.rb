# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user_one = users(:one)
    @user_two = users(:two)
    @user_three = users(:three)
  end

  test 'valid following user' do
    assert_not @user_one.following?(@user_two)

    @user_one.follow(@user_two)

    assert @user_one.following?(@user_two)
  end

  test 'invalid following user' do
    assert_not @user_one.following?(@user_two)
  end

  test 'valid followed by user' do
    assert_not @user_two.followed_by?(@user_one)

    @user_one.follow(@user_two)

    assert @user_two.followed_by?(@user_one)
  end

  test 'invalid followed by user' do
    assert_not @user_two.followed_by?(@user_one)
  end

  test 'follow a user' do
    @user_one.follow(@user_two)
    assert @user_one.following?(@user_two)
  end

  test 'unfollow a user' do
    @user_one.follow(@user_two)
    assert @user_one.following?(@user_two)

    @user_one.unfollow(@user_two)
    assert_not @user_one.following?(@user_two)
  end

  test 'should return name if name exist' do
    assert_equal @user_three.name_or_email, @user_three.name
  end

  test 'should return email if name not exist' do
    assert_equal @user_one.name_or_email, @user_one.email
  end
end
