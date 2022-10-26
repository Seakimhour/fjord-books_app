# frozen_string_literal: true

require 'application_system_test_case'

class RelationshipsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user_one = users(:one)
    @user_two = users(:two)
    @user_three = users(:three)

    @user_two.follow(@user_three)

    sign_in @user_two
  end

  test 'following a user' do
    visit user_url(@user_one)
    click_on 'フォローする'

    assert_text 'フォローしました。'
  end

  test 'unfollow a user' do
    visit user_url(@user_three)
    click_on 'フォロー解除する'

    assert_text 'フォロー解除しました。'
  end
end
