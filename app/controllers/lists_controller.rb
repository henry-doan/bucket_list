class ListsController < ApplicationController
  before_action :list, only: [:show, :edit, :update, :destroy]
  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
    commontator_thread_show(@list)
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

  def copy
    copy_list = List.find(params[:id])
    current_user.lists << copy_list.deep_clone(include: :items)
    current_user.save
    redirect_to root_path
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

  def copy
    copy_list = List.find(params[:id])
    current_user.lists << copy_list.deep_clone(include: :items)
    current_user.save
    redirect_to root_path
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
