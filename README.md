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
## Foods
`GET /api/v1/foods` Returns all the food in the database:
```JSON
{
    "id": 1,
    "name": "Banana",
    "calories": 150
},
```



