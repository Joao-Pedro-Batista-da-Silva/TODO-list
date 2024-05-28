class ListsController < ApplicationController
  def index
    @lists = List.all
  end
  def show
    @topic = List.find_by(id: params[:id])
    redirect_to lists_path if @topic.blank?
  end
end
