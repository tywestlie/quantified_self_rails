require 'rails_helper'

describe 'Meals API' do
  it 'returns all meals and their associated foods'do
    get '/api/v1/meals'

    expect(response).to be_successful
  end
end
