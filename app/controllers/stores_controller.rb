class StoresController < ApplicationController

  def index
    binding.pry
    result = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,name&pageSize=2&apiKey=#{ENV['BEST-BUY-API']}")
  end
end
