class ListsController < ApplicationController
  def index
    @lists = List.all.order(created_at: :desc)
  end

  def show
    set_list
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
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

  private
  def set_list
    @list = List.find_by(id: params[:id])
    redirect_to lists_path if @list.blank?
  end
  def list_params
    params.require(:list).permit(:title,:content)
  end
end
