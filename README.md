## Concessions API

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
            "description": "Delicious cheesecake"
        }]
    }

post '/products'

    {
        "product": {
            "name": "Some product",
            "price_in_cents": 1000,
            "description": "Some product description."
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