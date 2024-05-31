class ItemsController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_list
  def new
    @item = Item.new
  end

  def show

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    set_item
    @item&.destroy
    redirect_to lists_path
  end

  def set_list
    temp = params[:list_id]
    #temp = temp.to_i
    @list = current_user.lists.find_by(id: temp)
    #redirect_to lists_path if @list.blank?
  end

  def set_item
    @item = Item.find_by(id: params[:id])
  end

  def item_params
    params.require(:item).permit(:content, :list_id)
  end
end
