# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @user = users(:two)
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end
end
