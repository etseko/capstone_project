require 'test_helper'

class ApplianceTest < ActiveSupport::TestCase
  test "should not save appliance with without efficiency rating" do
    appliance = Appliance.new
    assert_not appliance.save, "Saved the article without efficiency rating"
  end
end
