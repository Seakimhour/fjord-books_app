# frozen_string_literal: true

require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @user_two = users(:two)
    @user_three = users(:three)

    post user_relationships_url(@user_three)
  end

  test 'should create follow' do
    assert_difference('Relationship.count') do
      post user_relationships_url(@user_two)
    end
    
    assert_redirected_to user_path(@user_two)
  end

  test 'should destroy follow' do
    assert_difference('Relationship.count', -1) do
      delete user_relationships_url(@user_three)
    end

    assert_redirected_to user_path(@user_three)
  end
end
