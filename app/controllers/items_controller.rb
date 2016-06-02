class ItemsController < ApplicationController
  before_action :item, only: [:show, :edit, :destroy, :update] 


  def index
  	@items = current_user.list.items
  end

  def show
  end

  def edit
  end

  def new
  	@item = Item.new
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

