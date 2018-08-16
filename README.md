# Quantified Self: Rails Back-end

This application is a Ruby on Rails back-end that is designed to serve food, meal and calorie information via JSON payloads to a javaScript front-end found [here](http://grateful-fairies.surge.sh/index.html). The Rails API is also deployed [here](https://quantified-self-rails-.herokuapp.com/).

# Running Locally

* Clone this application:
```
git clone https://github.com/tywestlie/quantified_self_rails.git
```
* Run Bundle to install the gemfile:
```ruby
bundle install
bundle update
```
* Create and seed the database:
```ruby
rake db:create
rake db:migrate
rake db:seed
```
* Run the test suite:
```ruby
rspec
```

# Requests
These are the possible requests from the application and their JSON payloads.
## Food Endpoints
`GET /api/v1/foods` Returns all the food in the database:
```JSON
[
    {
        id: 1,
        name: "Bacon",
        calories: 500
    },
    {
        id: 2,
        name: "More Bacon",
        calories: 700
    },
    {
        id: 3,
        name: "Ham Sammy",
        calories: 800
    },
    {
        id: 4,
        name: "Burrito",
        calories: 1200
    }
]
```
`GET /api/v1/foods/:id` Returns a single food object from the `:id` you've pased
```JSON
  {
    id: 4,
    name: "Burrito",
    calories: 1200
  }
```
`POST /api/v1/foods` Creates and returns a new food from the following parameters format
```JSON
{ "food": { "name": "Name of food here", "calories": "Calories here"} }
```
`PATCH /api/v1/foods/:id` Updates a food that already exists in the database based on the following parameters.
```JSON
{ "food": { "name": "Mint", "calories": "14"} }
```
`DELETE /api/v1/foods/:id` Deletes a food with the passed `:id`
## Meal Enpoints






