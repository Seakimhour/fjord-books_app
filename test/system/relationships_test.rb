# frozen_string_literal: true

require 'application_system_test_case'

class RelationshipsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user_one = users(:one)
    @user_two = users(:two)
    @user_three = users(:three)

    @user_one.follow(@user_three)

    sign_in @user_one
  end

  test 'following a user' do
    assert_not @user_one.following?(@user_two)

    visit user_url(@user_two)
    click_on 'フォローする'

    assert_text 'フォローしました。'
    assert_selector :button, type: 'submit', value: 'フォロー解除する'

    assert @user_one.following?(@user_two)
  end

  test 'unfollow a user' do
    assert @user_one.following?(@user_three)

    visit user_url(@user_three)
    click_on 'フォロー解除する'

    assert_text 'フォロー解除しました。'
    assert_selector :button, type: 'submit', value: 'フォローする'

    assert_not @user_one.following?(@user_three)
  end
end
