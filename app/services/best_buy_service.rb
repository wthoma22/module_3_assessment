class BestBuyService

  def self.get_all_near(zip)
    connection = Faraday.new(url: "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=100&apiKey=445jt4mb4gsenju48n2ndu8d")
    response = connection.get
    raw_stores = JSON.parse(response.body, symbolize_names: true)
    raw_stores[:stores]
  end

  # def initialize(zip)
  #   @zip = zip
  # end
  #
  # def conn
  #   Faraday.new(:url => 'https://api.bestbuy.com/v1/') do |faraday|
  #     faraday.request  :url_encoded
  #     faraday.response :logger
  #     faraday.adapter  Faraday.default_adapter
  #   end
  # end
  #
  # def response
  #   conn.get(default_api_path).body
  # end
  #
  # def default_api_path
  #   "(area(80202,25))?format=json&show=storeId,storeType,name&pageSize=2&apiKey=#{ENV["BEST-BUY-API"]}"
  # end
  #
  # def json_stores
  #   JSON.parse(response, symbolize_names: true)
  # end
  #
  # def stores
  #   json_stores.map do |raw_store|
  #     Store.new(raw_store)
  #   end
  # end
end
