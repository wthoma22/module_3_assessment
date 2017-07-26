require 'rails_helper'

RSpec.describe "Items API endpoints" do
  before do
    @item1 = create(:item)
    @item2 = create(:item, name: "Wooden Lamp")
    @item3 = create(:item, name: "Copper Keyboard")
  end

  it "it returns all items" do
    get '/api/v1/items'

    count = Item.count
    expect(response).to be_success
    json_response = JSON.parse(response.body, symbolize_names: true)
    item = json_response.first

    expect(json_response.count).to eq(count)
    expect(item).to have_key(:name)
    expect(item[:name]).to be_a String
    expect(item).to have_key(:description)
    expect(item[:description]).to be_a String
    expect(item).to have_key(:image_url)
    expect(item[:image_url]).to be_a String
  end

  it "shows an item" do
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

  it "deletes an item" do
    count = Item.count
    expect(Item.count).to eq(count)

    delete api_v1_item_path(@item1)

    expect(Item.count).to eq(count - 1)
    expect(response).to be_success
  end

  xit "creates an item" do
    params = { name: "Widget", description: "Just Lovely", image_url: "google.com" }
    post api_v1_items_path, params: { item: params }

    expect(response).to be_success
    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:name]).to eq("Widget")
    expect(item[:description]).to eq("Just Lovely")
    expect(item[:image_url]).to eq("google.com")
    expect(item).to have_key(:name)
    expect(item[:name]).to be_a String
    expect(item).to have_key(:description)
    expect(item[:description]).to be_a String
    expect(item).to have_key(:image_url)
    expect(item[:image_url]).to be_a String
  end
end
