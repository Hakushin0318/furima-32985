class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_item, except: [:index, :new, :create]
  before_action :move_to_index, except: [:index, :show, :new, :create]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :details, :category_id, :state_id, :delivery_fee_id, :delivery_source_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
