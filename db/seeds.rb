user = User.first_or_create(name: "Test User", email: "test_user@gmail.com",
            password: "password", password_confirmation: "password")
vendor = Vendor.first_or_create(name: "Test Vendor")
store = Store.first_or_create(vendor: vendor, name: "1", street_one: "123 Some Street",
             street_two: "suite 1A", city: "Houston", state: "Texas",
             zip_code: 77002)
product = Product.first_or_create(name: "Cheesecake", price_in_cents: 700,
                         description: "Delicious cheesecake", store: store,
                         vendor: vendor)
order = Order.first_or_create(user: user, store: store, pickup_time: Time.now,
                     product_ids: [product.id])