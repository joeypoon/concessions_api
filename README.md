## Concession API

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