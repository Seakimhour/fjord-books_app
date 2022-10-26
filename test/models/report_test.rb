# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @user_one = users(:one)
    @user_two = users(:two)
  end

  test 'valid report' do
    report = @user_one.reports.new(title: 'Report one', content: 'This is report one')
    assert report.valid?
  end

  test 'invalid without user' do
    report = Report.new(title: 'Report one', content: 'This is report one')
    assert_not report.valid?

    report.user = @user_one
    assert report.valid?
  end

  test 'invalid without title' do
    report = @user_one.reports.new(content: 'This is report one')
    assert_not report.valid?

    report.title = 'Report one'
    assert report.valid?
  end

  test 'invalid without content' do
    report = @user_one.reports.new(title: 'Report one')
    assert_not report.valid?

    report.content = 'This is report one'
    assert report.valid?
  end

  test 'valid editable?' do
    report = @user_one.reports.new(title: 'Report one', content: 'This is report one')

    assert report.editable?(@user_one)
  end

  test 'invalid editable?' do
    report = @user_one.reports.new(title: 'Report one', content: 'This is report one')

    assert_not report.editable?(@user_two)
  end
end
