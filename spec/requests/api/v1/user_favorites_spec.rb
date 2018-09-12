require 'rails_helper'

describe 'GET /api/v1/user/favorites?api_key=abc123' do
  it 'returns a JSON response with the data of the favorites asteroids' do
    user = create(:user, email: "uncle.jesse@example.com", name: "Jesse Katsopolis")
    api_key = create(:api_key, user_id: user.id)
    favorite_id = create(:favorite, user_id: user.id).id

    get "/api/v1/user/favorites?api_key=#{api_key.value}"

    expect(response.status).to eq 200
    favorite = JSON.parse(response.body, symbolize_names: true)
    expect(favorite[0][:id]).to eq(favorite_id)
    expect(favorite[0][:user_id]).to eq(user.id)
    expect(favorite[0][:neo_reference_id]).to eq('2324')
    expect(favorite[0][:asteroid][:name]).to eq()
    # "asteroid": {
    #   "name": "153306 (2001 JL1)",
    #   "is_potentially_hazardous_asteroid": false,
    # }
  end
end
