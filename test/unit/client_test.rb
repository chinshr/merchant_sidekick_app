require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "should have a billing address" do
    assert_difference "Client.count" do
      assert_difference "BillingAddress.count" do
        @client = Client.new :first_name => "Hans", :last_name => "Smith"
        @client.build_billing_address :first_name => "Hans", :last_name => "Smith", :address_line_1 => "650 Balboa St.", :address_line_2 => "House 1",
          :city => "San Francisco", :postal_code => "94130", :state => "CA"
        @client.save!
      end
    end
  end
end
