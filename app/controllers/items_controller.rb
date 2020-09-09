class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index :show]
  # before_action :authenticate_user!
    
  def index
  end

  def new
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :image).merge(user_id: current_user.id)
  end
end