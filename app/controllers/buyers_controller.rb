class BuyersController < ApplicationController
  before_action :move_to_another, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order = OrderBuyer.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderBuyer.new(buyer_params)
    if @order.valid?
       pay_item
       @order.save
       return redirect_to root_path
    else
    render 'index'
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],  
      currency:'jpy'
    )
  end

  def buyer_params
    params.permit(:postal, :prefectures_id, :city, :address, :building, :phone, :token, :item_id).merge(user_id: current_user.id)
  end

  def move_to_another 
    @user = Item.find(params[:item_id])
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    if user_signed_in? && current_user.id == @user.user_id
      redirect_to root_path 
    end
  end

end
