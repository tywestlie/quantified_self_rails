require 'rails_helper'

describe 'Meals API' do
  describe 'Index' do
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

  describe 'Show' do
    it "returns a meal and all the foods associated" do
      meal1 = create(:meal)
      meal2 = create(:meal)

      food1 = meal1.foods.create(name: 'sugar cubes', calories: '1200')

      food2 = meal2.foods.create(name: 'yams', calories: '300')

      get "/api/v1/meals/#{meal1.id}/foods"

      expect(response).to be_successful
      parsed_meal = JSON.parse(response.body)
      expect(parsed_meal['name']).to eq(meal1.name)
      expect(parsed_meal['foods'][0]['name']).to eq(food1.name)
      expect(parsed_meal['foods'][0]['calories']).to eq(food1.calories)
    end
  end

  describe 'Post' do
    it "can post a food to a meal" do
      meal1 = create(:meal)
      meal2 = create(:meal)

      food1 = create(:food)
      food2 = create(:food)

      post "/api/v1/meals/#{meal1.id}/foods/#{food1.id}"

      expect(response).to be_successful

      message = JSON.parse(response.body)
      expect(message["message"]).to eq("Successfully added #{food1.name} to #{meal1.name}")
    end
  end

  describe 'Delete' do
    it "can delete a food from a meal" do
      meal1 = create(:meal)
      meal2 = create(:meal)

      food1 = meal1.foods.create(name: 'sugar cubes', calories: '1200')
      food2 = meal1.foods.create(name: 'yams', calories: '300')

      food3 = meal2.foods.create(name: 'eggs', calories: '600')
      food4 = meal2.foods.create(name: 'green ham', calories: '5000')

      delete "/api/v1/meals/#{meal1.id}/foods/#{food2.id}"

      expect(response).to be_successful

      message = JSON.parse(response.body)

      expect(message["message"]).to eq("Successfully removed #{food2.name} from #{meal1.name}")
    end
  end
end
