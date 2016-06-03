class LandingPageController < ApplicationController
  def index
    @lists = current_user.lists.paginate(page: params[:page], :per_page => 2)
  end

  def show
  end

  def edit
  end

  def new
  end
end
