# class BestBuyService
#
#   def initialize(zip)
#     @zip = zip
#   end
# 
#   def connection
#     @conn ||= Faraday.new("https://api.bestbuy.com/v1/stores")
#   end
#
#   def response
#     connection.get(default_api_path).body
#   end
#
#   def default_api_path
#     "(area(80202,25))?format=json&show=storeId,storeType,name&pageSize=2&apiKey=#{ENV["BEST-BUY-API"]}"
#   end
#
#   def json_stores
#     JSON.parse(response, symbolize_names: true)
#   end
#
#   def stores
#     json_stores.map do |raw_store|
#       Store.new(raw_store)
#     end
#   end
# end
