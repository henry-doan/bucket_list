class ItemsController < ApplicationController
  before_action :list, only: [:edit, :new]
  before_action :item, only: [:show, :edit, :destroy, :update] 


  def index
  	@items = current_user.lists.find(params[:list_id]).items
  end

  def show
  end

  def edit
  end

  def new
  	@item = Item.new
  end

  def create
    @item = current_user.lists.find(params[:list_id]).items.new(item_params)
    if @item.save
      redirect_to list_path(params[:list_id])
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to list_item_path(@item.list, @item)
    else
      render :edit
  	end
	end
# Method for create
	def destroy
    @item.destroy
    redirect_to list_path(params[:list_id])
  end

	private

		def item_params
	    params.require(:item).permit(:name, :description, :like, :complete, :classification)
	  end

		def item
	  	@item = Item.find(params[:id])
	  end

    def list
      @list = List.find(params[:list_id])
    end
end

