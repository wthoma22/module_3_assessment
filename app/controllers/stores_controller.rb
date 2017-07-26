class StoresController < ApplicationController

  def index
    service = BestBuyService.new(@zip)
    @stores = service.stores
    @total = service.total
  end
end
