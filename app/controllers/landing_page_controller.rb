class LandingPageController < ApplicationController
  

  def index
    @ex_lists = List.all
    @lists = current_user.lists.paginate(page: params[:page], :per_page => 2)
    @comments = CommontatorComment.all.where(deleted_at: nil)
  end

  def show
  	commontator_thread_show(@list) 
  end

  def edit
  end

  def new
  end
end
