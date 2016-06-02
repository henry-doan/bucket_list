class ItemsController < ApplicationController
  before_action :list
  before_action :item, only: [:index, :new, :create, :show, :edit] 


  def index
  	@items = current_user.items
  end

  def show
  	current_user.items.find(params[:id])
  end

  def edit
  end

  def new
  	@item = current_user.items.new
  end

  def update
  	@item = @item.find(params[:id])
    if @location.update(location_params)
      redirect_to friend_path(@friend)
    else
      render :edit
  	end
	end

	def destroy
    @item.destroy
    redirect_to list_item_path(@item)
  end

	private

		def item_params
	    params.require(:item).permit(:name, :description, :like, :complete, :type )
	  end

	  def item
	  	@item = current_user.items.find(params[:id])
	  end

	  def list
	  	@list = current_user.lists.find(params[:id])
	  end
	end
end
