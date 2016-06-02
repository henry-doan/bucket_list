class ItemsController < ApplicationController
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
    @list = List.find(params[:list_id])
  end

  def create
    @item = current_user.lists.find(params[:list_id]).items.new(item_params)
    if @item.save
      redirect_to list_item_path(@item.list, @item)
    else
      render :new
    end
  end

  def update
    if @location.update(location_params)
      redirect_to friend_path(@friend)
    else
      render :edit
  	end
	end
# Method for create
	def destroy
    @item.destroy
    redirect_to list_item_path(@item)
  end

	private

		def item_params
	    params.require(:item).permit(:name, :description, :like, :complete, :type )
	  end

		def item
	  	@item = Item.find(params[:id])
	  end

    def list
      @list = List.find(params[:id])
    end
end

