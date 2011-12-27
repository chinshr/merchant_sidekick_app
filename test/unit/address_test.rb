require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "should validate city attribute" do
    @address = MerchantSidekick::Addressable::Address.new
    assert_equal false, @address.valid?
    assert @address.errors[:city]
  end
end
