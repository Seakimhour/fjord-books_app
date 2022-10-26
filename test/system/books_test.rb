# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a book' do
    visit books_url
    click_on '新規作成'

    fill_in 'book[title]', with: 'new book'
    fill_in 'book[memo]', with: 'book memo'
    click_on '登録する'

    assert_text '本が作成されました。'
  end

  test 'updating a book' do
    visit books_url
    click_on '編集', match: :prefer_exact

    fill_in 'book[title]', with: 'new book'
    fill_in 'book[memo]', with: 'book memo'
    click_on '更新する'

    assert_text '本が更新されました。'
  end

  test 'destroying a book' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
