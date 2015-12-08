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