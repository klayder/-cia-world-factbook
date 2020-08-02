require 'test_helper'

class CountryStatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get country_stats_index_url
    assert_response :success
  end

end
