class ItemsController < ApplicationController
  before_action :require_user

  def index
    @items = Item.all
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    binding.pry
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :model, :price, :serial, :end_of_warranty, :purchase_date, :purchase_location, :method_of_payment, :notes)
  end

end