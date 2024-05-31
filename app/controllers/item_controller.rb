class ItemController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_list
  def new_item
    @item = Item.new
  end

  def show

  end

  def create
    #logger.debug "id============================ #{params[:id]}
    @item = Item.new(item_params)
    if @item.save
      redirect_to lists_path
    else
      render :new_item, status: :unprocessable_entity
    end

  end

  def set_list
    temp = params[:list_id]
    #temp = temp.to_i
    @list = current_user.lists.find_by(id: temp)
    #redirect_to lists_path if @list.blank?
  end

  def item_params
    params.require(:item).permit(:content, :list_id)
  end
end
