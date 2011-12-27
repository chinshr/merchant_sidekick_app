ActiveMerchant::Billing::Base.mode = :test
MerchantSidekick::Gateways::Gateway.default_gateway = ActiveMerchant::Billing::BogusGateway.new
ActiveMerchant::Billing::CreditCard.require_verification_value = true