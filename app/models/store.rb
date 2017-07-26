class Store
  attr_reader :name, :storeId, :store_Type

  def initialize(raw_store)
    @name = raw_store["name"]
    @store_Id = raw_store["storeId"]
    @store_Type = raw_store["store_Type"]
  end
end
