# frozen_string_literal: true

require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:allison)
    @hansen = users(:hansen)
    @eriobu = users(:eriobu)

    post user_relationships_url(@eriobu)
  end

  test 'should create follow' do
    assert_difference('Relationship.count') do
      post user_relationships_url(@hansen)
    end

    assert_redirected_to user_path(@hansen)
  end

  test 'should destroy follow' do
    assert_difference('Relationship.count', -1) do
      delete user_relationships_url(@eriobu)
    end

    assert_redirected_to user_path(@eriobu)
  end
end
