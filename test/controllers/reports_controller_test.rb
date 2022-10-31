# frozen_string_literal: true

require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:allison)
    @the_followship_of_the_ring_review = reports(:the_followship_of_the_ring_review)
  end

  test 'should get index' do
    get reports_url
    assert_response :success
  end

  test 'should get new' do
    get new_report_url
    assert_response :success
  end

  test 'should create report' do
    assert_difference('Report.count') do
      post reports_url, params: { report: { title: @the_followship_of_the_ring_review.title, content: @the_followship_of_the_ring_review.content } }
    end

    assert_redirected_to report_url(Report.last)
  end

  test 'should show report' do
    get report_url(@the_followship_of_the_ring_review)
    assert_response :success
  end

  test 'should get edit' do
    get edit_report_url(@the_followship_of_the_ring_review)
    assert_response :success
  end

  test 'should update report' do
    patch report_url(@the_followship_of_the_ring_review), params: { report: { title: @the_followship_of_the_ring_review.title, content: @the_followship_of_the_ring_review.content } }
    assert_redirected_to report_url(@the_followship_of_the_ring_review)
  end

  test 'should destroy report' do
    assert_difference('Report.count', -1) do
      delete report_url(@the_followship_of_the_ring_review)
    end

    assert_redirected_to reports_url
  end
end
