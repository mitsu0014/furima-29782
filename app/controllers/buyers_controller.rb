class BuyersController < ApplicationController
  before_action :move_to_another, only: [:index]
  before_action :item_find, only: [:index, :create]

  def index
    @order = OrderBuyer.new
  end

  def create
    @order = OrderBuyer.new(buyer_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def buyer_params
    params.permit(:postal, :prefectures_id, :city, :address, :building, :phone, :token, :item_id).merge(user_id: current_user.id)
  end

  def move_to_another
    @order = Order.pluck(:item_id)
    @user = Item.find(params[:item_id])
    redirect_to new_user_session_path unless user_signed_in?
    if user_signed_in? && current_user.id == @user.user_id
      redirect_to root_path
    elsif @order.include?(@user.id)
      redirect_to root_path
    end
  end
end
