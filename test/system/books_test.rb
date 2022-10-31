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

    fill_in 'book[title]', with: 'The Return of the King'
    fill_in 'book[memo]', with: 'final volume'
    click_on '登録する'

    assert_text '本が作成されました。'

    assert_text 'The Return of the King'
    assert_text 'final volume'
  end

  test 'updating a book' do
    visit books_url

    click_on '編集', match: :prefer_exact

    assert_selector :field, type: 'text', with: 'The Fellowship of the Ring'
    assert_selector :field, type: 'textarea', with: 'first part'

    # without reset value, sometimes new value will append to existing value. only happens on the first fill_in
    # https://github.com/redux-form/redux-form/issues/686

    fill_in 'book[title]', with: 'The Return of the King', fill_options: { clear: :backspace }
    fill_in 'book[memo]', with: 'final volume'
    click_on '更新する'

    assert_text '本が更新されました。'
    
    assert_no_text 'The Fellowship of the Ring'
    assert_no_text 'first part'

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
