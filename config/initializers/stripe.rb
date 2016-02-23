Stripe.api_key = ENV["STRIPE_API_KEY"]

module Stripe
  class Token
    def self.get_test
      visa_number = "4242424242424242"
      self.create(
        :card => {
          :number => visa_number,
          :exp_month => 2,
          :exp_year => 2017,
          :cvc => "314"
        }
      )
    end
  end
end