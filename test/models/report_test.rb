# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @report = reports(:two)
  end

  test 'valid report' do
    report = Report.new(title: 'Report one', content: 'This is report one', user_id: @user.id)
    assert report.valid?
  end

  test 'invalid without user' do
    report = Report.new(title: 'Report one', content: 'This is report one')
    refute report.valid?
  end

  test 'invalid without title' do
    report = Report.new(content: 'This is report one', user_id: @user.id)
    refute report.valid?
  end

  test 'invalid without content' do
    report = Report.new(title: 'Report one', user_id: @user.id)
    refute report.valid?
  end

  test 'invalid editable?' do
    refute @report.editable?(@user)
  end
end
