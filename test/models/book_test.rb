# frozen_string_literal: true

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'valid book' do
    book = Book.new
    assert book.valid?
  end
end
