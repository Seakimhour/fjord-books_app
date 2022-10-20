# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)

    sign_in users(:one)
  end

  test 'visiting the index' do
    visit users_url
    assert_selector 'h1', text: User.model_name.human
  end
end