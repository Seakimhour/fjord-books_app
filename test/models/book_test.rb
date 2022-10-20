# frozen_string_literal: true

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test 'valid book' do
    book = Book.new()
    assert book.valid?
  end
end
