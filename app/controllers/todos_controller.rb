class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
    @list = List.find(params[:list_id])
  end

  def show
    @todo = Todo.find params[:id]
    @list = @todo.list
  end

  def create
    @list = List.find(params[:list_id])
    @todo = Todo.new params[:todo].merge(:list => @list)
    if @todo.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find params[:id]
    @list = @todo.list
  end

  def update
    @todo = Todo.find params[:id]
    @list = @todo.list
    @todo.update_attributes(params[:todo])
    if @todo.save
      redirect_to list_path(@list)
    else
      flash[:notice] = "Error! Todo did not update."
      redirect_to :edit
    end
  end
end
