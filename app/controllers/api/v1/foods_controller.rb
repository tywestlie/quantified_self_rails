class Api::V1::FoodsController < ApplicationController

  def index
    render json: Food.all
  end

  def show
    render json: Food.find(params[:id])
  end

  def create
    food = Food.new(food_params)
    if food.save
      render json: food
    else
      render status: 400
    end
  end

  def update
    food = Food.find(params[:id])
    food.update(food_params)
    render json: food
  end

  def destroy
    food = Food.find(params[:id])
    food.delete
    render status: 204
  end

  private

  def food_params
     params.require('food').permit('name', 'calories')
  end

end
