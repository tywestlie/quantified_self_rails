require 'rails_helper'

describe 'Meals API' do
  it 'returns all meals and their associated foods'do
    meal1 = create(:meal)
    meal2 = create(:meal)

    food1 = meal1.foods.create(name: 'sugar cubes', calories: '1200')

    food2 = meal2.foods.create(name: 'yams', calories: '300')

    get '/api/v1/meals'

    expect(response).to be_successful

    parsed_meals = JSON.parse(response.body)
    expect(parsed_meals[0]['name']).to eq(meal1.name)
    expect(parsed_meals[0]['foods'][0]['name']).to eq(food1.name)
    expect(parsed_meals[0]['foods'][0]['calories']).to eq(food1.calories)

    expect(parsed_meals[1]['name']).to eq(meal2.name)
    expect(parsed_meals[1]['foods'][0]['name']).to eq(food2.name)
    expect(parsed_meals[1]['foods'][0]['calories']).to eq(food2.calories)
  end
end
