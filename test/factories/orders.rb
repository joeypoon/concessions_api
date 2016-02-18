FactoryGirl.define do
  factory :order do
    user
    store
    pickup_time Time.now
    status "placed"
  end
end