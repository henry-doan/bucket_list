class LandingPageController < ApplicationController
  def index
    @lists = current_user.lists
  end

  def show
  end

  def edit
  end

  def new
  end
end
