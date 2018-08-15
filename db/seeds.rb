# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

meal1 = Meal.create(name: 'Breakfast')
meal1.foods.create(name: 'Bacon', calories: 500)
meal1.foods.create(name: 'More Bacon', calories: 700)

meal2 = Meal.create(name: 'Lunch')
meal2.foods.create(name: 'Ham Sammy', calories: 800)
meal2.foods.create(name: 'Burrito', calories: 1200)

meal3 = Meal.create(name: 'Dinner')
meal3.foods.create(name: 'Cheese', calories: 500)
meal3.foods.create(name: 'More Cheese', calories: 500)


meal4 = Meal.create(name: 'Snack')
meal4.foods.create(name:'Pizza', calories: '450')
meal4.foods.create(name:'Gryos', calories: '600')
