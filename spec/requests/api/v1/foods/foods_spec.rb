require 'rails_helper'

describe 'Foods API' do
  describe 'index' do
    it 'returns all the food items' do
      foods = create_list(:food, 5)

      get '/api/v1/foods'

      expect(response).to be_successful

      parsed_foods = JSON.parse(response.body)

      expect(foods.count).to eq(5)
    end

    it 'returns the correct format' do
      foods = create_list(:food, 5)

      get '/api/v1/foods'

      expect(response).to be_successful

      parsed_foods = JSON.parse(response.body)

      expect(parsed_foods[0].keys.include?('created_at')).to be_falsy
      expect(parsed_foods[0].keys.include?('updated_at')).to be_falsy
    end
  end

  describe 'show' do
    it 'returns a single food item' do
      food1 = create(:food)
      food2 = create(:food)
      food3 = create(:food)

      get "/api/v1/foods/#{food2.id}"

      expect(response).to be_successful
    end

    it 'returns the proper format' do
      food1 = create(:food)
      food2 = create(:food)
      food3 = create(:food)

      get "/api/v1/foods/#{food2.id}"

      expect(response).to be_successful

      parsed_food = JSON.parse(response.body)

      expect(parsed_food.keys.include?('created_at')).to be_falsy
      expect(parsed_food.keys.include?('updated_at')).to be_falsy
    end
  end

  describe 'create' do
    it 'can create a new food' do
      params = { 'food': { 'name': 'sugar cubes', 'calories': '1200'} }

      post '/api/v1/foods', params: params

      new_food = JSON.parse(response.body)

      expect(new_food['name']).to eq('sugar cubes')
      expect(new_food['calories']).to eq(1200)
    end

    it 'renders 400 if params incorrect' do
      params = { 'food': {'name': 'sugar cubes'}}

      post '/api/v1/foods', params: params

      expect(response.status).to eq(400)
    end
  end
end
