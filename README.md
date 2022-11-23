# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

Through building this app, I practiced my skill of adding features in MVC pattern with Ruby on Rails, my ways of interacting with data base through Active Record, and writing various types of test abilities (including RSpec and Cypress on Rails).


## Screenshots

!["the defult page when the app firstly loaded"](https://github.com/Tank-Sun/jungle/blob/master/docs/home-page.png?raw=true)
!["the my cart page when the <pay with card> button is clicked"](https://github.com/Tank-Sun/jungle/blob/master/docs/my-cart.png?raw=true)
!["the products page of admin"](https://github.com/Tank-Sun/jungle/blob/master/docs/admin-products.png?raw=true)




## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server



## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>


## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- bcrypt