require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  setup do
    @company = companies(:hometown_painting)
  end

  test "should return city and state for valid zip code" do
    @company.update(zip_code: "37201")
    assert_equal "Nashville,TN", @company.city_state
  end

  test "should return placeholder for invalid zip code" do
    @company.update(zip_code: "1")
    assert_equal "City, State", @company.city_state
  end

  test "should return placeholder for empty zip code" do
    @company.update(zip_code: nil)
    assert_equal "City, State", @company.city_state
  end
end
