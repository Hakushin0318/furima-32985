class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]
  before_action :move_to_index
  before_action :pay_item, only: [:create]

  def index
    @order_address = OrderAddress.new
  end

  def create
  end

  private

    def order_params
      params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end
  
    def move_to_index
      if current_user.id == @item.user_id || @item.order != nil
        redirect_to root_path
      end
    end

    def item_find
      @item = Item.find(params[:item_id])
    end

    def pay_item
      @order_address = OrderAddress.new(order_params)
      if @order_address.valid?
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item.price,
          card: order_params[:token],
          currency: 'jpy'
        )
        @order_address.save
        redirect_to root_path
      else
        render action: :index
      end
    end
end


