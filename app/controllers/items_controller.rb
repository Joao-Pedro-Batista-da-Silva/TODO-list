class ListsController < ApplicationController
  #def index
  #  @items = current_user.lists.order(created_at: :desc)=
  #end

  #def show
  #  set_list
  #end

  def new_item
    @item = list.items.new
  end

  def create_item
    @item = list.items.new_item(items_params)
    @item.save
  end

  #def destroy
  #  set_list
  #  @list.destroy
  #  redirect_to lists_path
  #end

  #def edit
  #  set_list
  #end

  #def update
  #  set_list
  #  if @list.update(list_params)
  #    redirect_to @list
  #  else
  #    render :edit, status: :unprocessable_entity
  #  end
  #end

end
