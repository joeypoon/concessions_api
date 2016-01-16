FactoryGirl.define do
  factory :store do
    name "I am a store"
    vendor
    street_one "Nibble St"
    street_two "Suite 1A"
    city "Houston"
    state "Texas"
    zip_code 77077
  end
end