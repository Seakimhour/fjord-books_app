# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test 'visiting the index' do
    visit users_url
    assert_selector 'h1', text: 'ユーザ'

    assert_text 'allison@example.com'
    assert_text 'hansen@example.com'
    assert_text 'eriobu@example.com'
    assert_text 'Eriobu'
  end
end
