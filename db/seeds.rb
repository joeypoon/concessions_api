# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "Test User", email: "test_user@gmail.com",
            password: "password", password_confirmation: "password")
vendor = Vendor.create(name: "Test Vendor")
store = Store.create(vendor: vendor, name: "1", street_one: "123 Some Street",
             street_two: "suite 1A", city: "Houston", state: "Texas",
             zip_code: 77002)
product = Product.create(name: "Cheesecake", price_in_cents: 700,
                         description: "Delicious cheesecake", store: store,
                         vendor: vendor)