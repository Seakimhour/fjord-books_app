# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @book = books(:one)

    sign_in users(:one)
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: Book.model_name.human
  end

  test 'creating a book' do
    visit books_url
    click_on I18n.t('views.common.new')

    fill_in 'book[title]', with: @book.title
    fill_in 'book[memo]', with: @book.memo
    click_on I18n.t('helpers.submit.create')

    assert_text I18n.t('controllers.common.notice_create', name: Book.model_name.human)
  end

  test 'updating a book' do
    visit books_url
    click_on I18n.t('views.common.edit'), match: :prefer_exact

    fill_in 'book[title]', with: @book.title
    fill_in 'book[memo]', with: @book.memo
    click_on I18n.t('helpers.submit.update')

    assert_text I18n.t('controllers.common.notice_update', name: Book.model_name.human)
  end

  test 'destroying a book' do
    visit books_url
    page.accept_confirm do
      click_on I18n.t('views.common.destroy'), match: :first
    end

    assert_text I18n.t('controllers.common.notice_destroy', name: Book.model_name.human)
  end
end
