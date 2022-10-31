# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:allison)
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'report[title]', with: 'The Return of the King Book Review'
    fill_in 'report[content]', with: 'This book, while a very long, is the perfect ending of the series.'
    click_on '登録する'

    assert_text '日報が作成されました。'

    assert_text 'The Return of the King Book Review'
    assert_text 'This book, while a very long, is the perfect ending of the series.'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集', match: :prefer_exact

    assert_selector :field, type: 'text', with: 'The Fellowship of the Ring Book Review'
    assert_selector :field, type: 'textarea', with: 'This book was great and I loved to read what I missed in the movies.'

    fill_in 'report[title]', with: 'The Return of the King Book Review', fill_options: { clear: :backspace }
    fill_in 'report[content]', with: 'This book, while a very long, is the perfect ending of the series.'
    click_on '更新する'

    assert_text '日報が更新されました。'
    
    assert_no_text 'The Fellowship of the Ring Book Review'
    assert_no_text 'This book was great and I loved to read what I missed in the movies.'

    assert_text 'The Return of the King Book Review'
    assert_text 'This book, while a very long, is the perfect ending of the series.'
  end

  test 'destroying a Report' do
    visit reports_url

    assert_text 'The Fellowship of the Ring Book Review'

    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
    
    assert_no_text 'The Fellowship of the Ring Book Review'
  end
end
