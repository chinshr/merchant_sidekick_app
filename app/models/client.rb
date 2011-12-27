class Client < ActiveRecord::Base
  has_address :billing
end
