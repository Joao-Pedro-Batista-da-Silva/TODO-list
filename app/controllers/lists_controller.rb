class ListsController < ApplicationController

  before_action :authenticate_user!


  def index
    @lists = current_user.lists.order(created_at: :desc)
  end

  def show
    set_list
  end

  def new
    @list = current_user.lists.new
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      session[:id] = @list.id
      redirect_to new_item_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    set_list
    @list.destroy
    redirect_to lists_path
  end

  def edit
    set_list
  end

  def update
    set_list
    if @list.update(list_params)
      redirect_to @list
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def set_list
    @list = current_user.lists.find_by(id: params[:id])
    redirect_to lists_path if @list.blank?
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
