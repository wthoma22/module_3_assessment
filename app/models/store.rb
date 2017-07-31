require './app/services/store_service'

class Store
  attr_reader :name, :description, :city, :distance, :phone, :store_type

  def initialize(store)
    @name = store[:longName]
    @description = store[:description]
    @city = store[:city]
    @distance = store[:distance]
    @phone = store[:phone]
    @store_type = store[:storeType]
  end

  def self.find_by_zip(zip)
    BestBuyService.find_by_zip(zip).map do |store|
      new(store)
    end
  end
end

  # def initialize(store)
  #   @name = store[:name]
  #   @storeId = store[:storeId]
  #   @storeType = store[:storeType]
  # end
# end
