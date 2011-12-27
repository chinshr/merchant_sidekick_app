require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "should use address" do
    assert_difference "Merchant.count" do
      assert_difference "MerchantSidekick::Addressable::Address.count" do
        @merchant = Merchant.new(:name => "Goodwolla Inc.", :description => "The home of the biodegradable bio yogurts.")
        @merchant.build_address :first_name => "John", :last_name => "Doe", :address_line_1 => "123 5th St.", :address_line_2 => "Apt. 2a",
          :city => "San Francisco", :postal_code => "94119", :state => "CA"
        @merchant.save!
      end
    end
  end
end
