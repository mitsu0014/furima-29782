class BuyersController < ApplicationController
  before_action :move_to_another, only: [:index]

  def index
      @buyer = Item.find(params[:item_id])
  end


  private

  def buyer_params
    params.permit(:text, :image, :price).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_another 
    @item = Item.find(params[:item_id])
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path 
    end
  end

end
