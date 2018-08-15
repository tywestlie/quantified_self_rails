class Api::V1::MealsController < ApplicationController
  def index
    render json: Meal.all
  end

  def show
    render json: Meal.find(params[:meal_id])
  end

  def update
    meal = Meal.find(params[:meal_id])
    meal.foods << Food.find(params[:foods_id])

    render json: {message: "Successfully added #{meal.foods.last.name} to #{meal.name}"}
  end
end
