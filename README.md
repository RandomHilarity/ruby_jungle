# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example, including testing.

## Images
!["Main products page"](docs/main.png)
!["Cart with items"](docs/cart.png)
!["Admin for del/add products"](docs/admin_products.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4242424242424242 for testing success scenarios, with any future date/CSC.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* BCrypt
* Bootstrap 3.3.6

## Dev Dependencies

* Capybara
* Poltergeist
