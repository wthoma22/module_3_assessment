class StoresController < ApplicationController

  def index
    result = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,name&pageSize=2&apiKey=#{ENV["BEST-BUY-API"]}")
    array = []
    raw_results = JSON.parse(result.body, symbolize_names: true)[:stores]
    raw_results.each do |store|
      array << Store.new(store)
    end
    @stores = array
  end
end
