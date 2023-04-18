class SearchesController < ApplicationController

  def search
    @range = params[:range]
    @menus = Menu.looks(params[:search], params[:word])
  end

end
