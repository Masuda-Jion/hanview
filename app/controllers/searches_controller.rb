class SearchesController < ApplicationController

  def search_result
    @range = params[:range]
    @menus = Menu.looks(params[:search], params[:word])
  end

end
