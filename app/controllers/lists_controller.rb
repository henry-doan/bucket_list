class ListsController < ApplicationController
  before_action :list, only: [:show, :edit, :update, :destroy]
  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = current_user.lists.new
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update
      redirect_to list_path(@list)
    else
      render :edit
    end
  end


  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

    def list_params
      params.require(:list).permit(:name, :description)
    end

    def list
      @list = current_user.lists.find(params[:id])
    end

end
