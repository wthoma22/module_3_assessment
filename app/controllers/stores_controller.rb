class StoresController < ApplicationController

  def index
    location = params[:find]
    @stores = Store.find_by_zip(location)
    # @stores_count = stores.count
    # @stores = stores.paginate(page: params[:page], per_page: 10)
  end
end
