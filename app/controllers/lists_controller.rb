class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @todos = @list.todos
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      redirect_to list_path @list
    else
      flash[:error] = "List did not save"
      redirect_to create_list_path
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:list][:id])
    @list.update_attributes(params[:list])
  end

  def destroy
    @list.delete(params[:id])
  end
end
