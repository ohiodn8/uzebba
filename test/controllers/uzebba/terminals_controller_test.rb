require 'test_helper'

module Uzebba
  class TerminalsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get terminals_index_url
      assert_response :success
    end

  end
end
