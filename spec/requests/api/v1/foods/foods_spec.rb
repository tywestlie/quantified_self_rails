require 'rails_helper'

describe 'Foods API' do
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
