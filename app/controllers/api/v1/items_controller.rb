class API::V1::ItemsController < ApplicationController
  before_action :set_before, except: [:index, :create]

  def index
    render json: Item.all
  end

  def show
    render json: @item
  end

  def create
    item = Item.new(item_params)
    if item.save!
      render json: item
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end

  def set_before
    @item = Item.find(params[:id])
  end

end
