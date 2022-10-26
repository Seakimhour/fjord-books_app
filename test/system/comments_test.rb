# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test 'creating a comment on a report' do
    visit reports_url
    click_on '詳細', match: :first

    fill_in 'comment[content]', with: 'new comment'
    click_on 'コメントする'

    assert_text 'コメントが投稿されました。'
  end
end
