# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:allison)
    @the_followship_of_the_ring = books(:the_followship_of_the_ring)
  end

  test 'should get index' do
    get books_url
    assert_response :success
  end

  test 'should get new' do
    get new_book_url
    assert_response :success
  end

  test 'should create book' do
    assert_difference('Book.count') do
      post books_url, params: { book: { memo: @the_followship_of_the_ring.memo, title: @the_followship_of_the_ring.title } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test 'should show book' do
    get book_url(@the_followship_of_the_ring)
    assert_response :success
  end

  test 'should get edit' do
    get edit_book_url(@the_followship_of_the_ring)
    assert_response :success
  end

  test 'should update book' do
    patch book_url(@the_followship_of_the_ring), params: { book: { memo: @the_followship_of_the_ring.memo, title: @the_followship_of_the_ring.title } }
    assert_redirected_to book_url(@the_followship_of_the_ring)
  end

  test 'should destroy book' do
    assert_difference('Book.count', -1) do
      delete book_url(@the_followship_of_the_ring)
    end

    assert_redirected_to books_url
  end
end
