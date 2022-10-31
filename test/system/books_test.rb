# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:allison)
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'The Return of the King'
    fill_in 'メモ', with: 'final volume'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'The Return of the King'
    assert_text 'final volume'
  end

  test 'updating a book' do
    visit books_url

    click_on '編集', match: :prefer_exact

    assert_field 'タイトル', with: 'The Fellowship of the Ring'
    assert_field 'メモ', with: 'first part'

    fill_in 'タイトル', with: 'The Return of the King'
    fill_in 'メモ', with: 'final volume'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text 'The Return of the King'
    assert_text 'final volume'
  end

  test 'destroying a book' do
    visit books_url

    assert_text 'The Fellowship of the Ring'
    assert_text 'first part'

    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
    assert_no_text 'The Fellowship of the Ring'
    assert_no_text 'first part'
  end
end
