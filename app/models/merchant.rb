class Merchant < ActiveRecord::Base
  has_address
  acts_as_seller
end
