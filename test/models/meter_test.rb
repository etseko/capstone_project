require 'test_helper'

class MeterTest < ActiveSupport::TestCase

test "should not save meter reading with with missing fields" do
    appliance = Appliance.new
    assert_not appliance.save, "Saved the meter reading with missing fields"
  end
end
