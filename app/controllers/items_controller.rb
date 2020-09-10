class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  # before_action :authenticate_user!
    
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    end
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :price, :text, :category, :status, :postage,:shipping_origin, :shipping_date).merge(user_id: current_user.id)
  end
end