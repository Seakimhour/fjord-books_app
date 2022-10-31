# frozen_string_literal: true

require 'application_system_test_case'

class RelationshipsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @allison = users(:allison)
    @hansen = users(:hansen)
    @eriobu = users(:eriobu)

    @allison.follow(@eriobu)

    sign_in @allison
  end

  test 'following a user' do
    assert_not @allison.following?(@hansen)

    visit user_url(@hansen)
    click_on 'フォローする'

    assert_text 'フォローしました。'
    assert_button 'フォロー解除する'

    assert @allison.following?(@hansen)
  end

  test 'unfollow a user' do
    assert @allison.following?(@eriobu)

    visit user_url(@eriobu)
    click_on 'フォロー解除する'

    assert_text 'フォロー解除しました。'
    assert_button 'フォローする'

    assert_not @allison.following?(@eriobu)
  end
end
