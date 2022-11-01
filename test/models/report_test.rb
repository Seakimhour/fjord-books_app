# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @allison = users(:allison)
    @hansen = users(:hansen)
  end

  test 'valid report' do
    report = @allison.reports.new(title: 'The Return of the King Book Review', content: 'J. R. R. Tolkien\'s The Lord of the Rings')
    assert report.valid?
  end

  test 'invalid without user' do
    report = Report.new(title: 'The Return of the King Book Review', content: 'J. R. R. Tolkien\'s The Lord of the Rings')
    assert_not report.valid?

    report.user = @allison
    assert report.valid?
  end

  test 'invalid without title' do
    report = @allison.reports.new(content: 'J. R. R. Tolkien\'s The Lord of the Rings')
    assert_not report.valid?

    report.title = 'The Return of the King Book Review'
    assert report.valid?
  end

  test 'invalid without content' do
    report = @allison.reports.new(title: 'The Return of the King Book Review')
    assert_not report.valid?

    report.content = 'J. R. R. Tolkien\'s The Lord of the Rings'
    assert report.valid?
  end

  test 'valid editable?' do
    report = @allison.reports.new(title: 'The Return of the King Book Review', content: 'J. R. R. Tolkien\'s The Lord of the Rings')

    assert report.editable?(@allison)
  end

  test 'invalid editable?' do
    report = @allison.reports.new(title: 'The Return of the King Book Review', content: 'J. R. R. Tolkien\'s The Lord of the Rings')

    assert_not report.editable?(@hansen)
  end
end
