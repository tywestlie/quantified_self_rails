class Api::V1::MealsController < ApplicationController
  def index
    render json: Meal.all
  end

  def show
    render json: Meal.find(params[:meal_id])
  end

  def update
    meal = Meal.find(params[:meal_id])
    if meal.foods << Food.find(params[:foods_id])
      render json: {message: "Successfully added #{meal.foods.last.name} to #{meal.name}"}
    else
      render json: {status: 404}
    end
  end

  def destroy
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:foods_id])
    meal_food = MealFood.find_by(meal_id: meal.id, food_id: food.id)
    if meal_food.destroy
      render json: {message: "Successfully removed #{food.name} from #{meal.name}"}
    else
      render json: {status: 404}
    end
  end
end
