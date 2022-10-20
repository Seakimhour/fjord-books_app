# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @comment = comments(:one)

    sign_in users(:one)
  end

  test 'creating a comment on a report' do
    visit reports_url
    click_on I18n.t('views.common.show'), match: :first

    fill_in 'comment[content]', with: @comment.content
    click_on I18n.t('shared.comments.create')

    assert_text I18n.t('controllers.common.notice_comment_created')
  end
end