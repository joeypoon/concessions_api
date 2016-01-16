## Concessions API
See [documentation](https://github.com/joeypoon/nibbleme_api/wiki).
Root URL: http://nibbleme.herokuapp.com/

#### Users
get '/users'

    {
        "users": [
            {
                "id": 1,
                "name": "Joey Poon",
                "email": "poonjf@gmail.com"
            },
            {
                "id": 2,
                "name": "test",
                "email": "test@gmail.com"
            }
        ]
    }

post '/users'

    {
        "user": {
            "name": "test",
            "email": "test@gmail.com",
            "password": "password",
            "password_confirmation": "password"
        }
    }

get '/users/:id'

    {
        "id": 1,
        "name": "Joey Poon",
        "email": "poonjf@gmail.com"
    }

#### Products
get '/products'

    {
        "products": [{
            "id": 1,
            "name": "Cheesecake",
            "price_in_cents": 1000,
            "description": "Delicious cheesecake",
        }]
    }

post '/products'

    {
        "product": {
            "name": "Some product",
            "price_in_cents": 1000,
            "description": "Some product description.",
            "vendor_id": 1,
            "store_id": 1
        }
    }

get '/products/:id'

    {
        "product": {
            "id": 1,
            "name": "Cheesecake",
            "price_in_cents": 1000,
            "description": "Delicious cheesecake"
        }
    }

#### Vendors
post '/vendors'

    {
        "vendor": {
            "name": "I am a vendor"
        }
    }

get '/vendors/:id'

    {
        "vendor": {
            "id": 1
            "name": "I am a vendor"
        }
    }

#### Stores
post '/stores'

    {
        "store": {
            "name": "I am a store",
            "vendor_id": 1,
            "street_one": "Nibble St.",
            "street_two": "Suite 1A",
            "city": "Houston",
            "state": "Texas",
            "zip_code": 77077
        }
    }

get '/stores/:id'

    {
        "store": {
            "name": "I am a store",
            "street_one": "Nibble St.",
            "street_two": "Suite 1A",
            "city": "Houston",
            "state": "Texas",
            "zip_code": 77077
        }
    }