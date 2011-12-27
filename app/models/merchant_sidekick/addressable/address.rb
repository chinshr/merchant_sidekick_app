module MerchantSidekick
  module Addressable
    class Address < ActiveRecord::Base
      validates_presence_of :city
    end
  end
end