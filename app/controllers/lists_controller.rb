class ListsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]
  def index
    @lists = current_user.lists
  end

  def show
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

  def edit
  end

  def update
  end


  def destroy
  end

  private

    def list_params
      params.require(:lists).permit(:name, :description)
    end

    def list
      @list = current_user.lists.find(params[:id])
    end

end
