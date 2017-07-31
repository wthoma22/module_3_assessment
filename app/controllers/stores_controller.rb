class StoresController < ApplicationController

  def index
    connection = Faraday.new(url: "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=longName,city,distance,phone,storeType&pageSize=100&apiKey=445jt4mb4gsenju48n2ndu8d")
    response = connection.get
    raw_stores = JSON.parse(response.body, symbolize_names: true)
    raw_stores[:stores]
  end
end
