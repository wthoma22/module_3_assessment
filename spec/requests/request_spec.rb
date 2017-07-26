require 'rails_helper'

RSpec.describe "Items API endpoints" do
  before do
    @item1 = create(:item)
    @item2 = create(:item)
    @item3 = create(:item)
  end

  scenario "it returns all items" do
    get 'api/v1/items'

    expect(response).to be_success
    json_response = JSON.parse(response.body, symbolize_names: true)
    item = json_response.first

    expect(json_response.count).to eq(3)
    expect(item).to have_key(:name)
    expect(item[:name]).to be_a String
    expect(item).to have_key(:description)
    expect(item[:description]).to be_a String
    expect(item).to have_key(:image_url)
    expect(item[:image_url]).to be_a String
  end

  scenario "shows an item" do
    get api_v1_item_path(@item1)

    expect(response).to be_success
    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:name]).to eq(@item1.name)
    expect(item[:description]).to eq(@item1.description)
    expect(item[:image_url]).to eq(@item1.image_url)
    expect(item).to have_key(:name)
    expect(item[:name]).to be_a String
    expect(item).to have_key(:description)
    expect(item[:description]).to be_a String
    expect(item).to have_key(:image_url)
    expect(item[:image_url]).to be_a String
  end

  scenario "deletes an item" do
    expect(Item.count).to eq(3)

    deletes api_v1_item(@item1)

    expect(Item.count).to eq(2)
    expect(response).to be_success
  end
end

### 1. Create an API
#
# For this challenge clone [Storedom](https://github.com/turingschool-examples/storedom).
#
# We need an API for the application that can both read and write data. Start by focusing on functionality for items. All of this should happen in a dedicated, versioned controller.
#
# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at
#
# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted
#
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# * Verify that your non-GET requests work using Postman or curl. (Hint: `ActionController::API`). Why doesn't the default `ApplicationController` support POST and PUT requests?
