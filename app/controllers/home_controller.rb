class HomeController < ApplicationController
  def index
  end

  def gui_prototype
    render :layout => 'gui_prototype'
  end
end
