class ItemsController < ApplicationController
  before_action :require_user
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = current_user.items
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params.merge!(user: current_user))
    
    if @item.save
      flash["success"] = "Your item is saved!"
      redirect_to items_path
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
      flash["success"] = "Your item details have been updated."
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy if current_user == @item.user
    flash["success"] = "The item has been deleted."
    redirect_to items_path
  end

  def search
    @items = Item.search_by_name(params[:q])
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :model, :price, :serial, :end_of_warranty, :purchase_date, :purchase_location, :method_of_payment, :notes)
  end

end