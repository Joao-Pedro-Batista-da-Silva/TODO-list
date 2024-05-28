class ListsController < ApplicationController
  def index
    @lists = List.all.order(created_at: :desc)
  end

  def show
    @topic = List.find_by(id: params[:id])
    redirect_to lists_path if @topic.blank?
  end

  def new
    @topic = List.new
  end

  def create
    @topic = List.new(topic_params)
    @topic.save!
  end

  private
  def topic_params
    params.require(:topic).permit(:title,:content)
  end
end
