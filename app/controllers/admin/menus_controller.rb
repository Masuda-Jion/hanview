class Admin::MenusController < ApplicationController

  before_action :authenticate_admin!

  def new
    @menu = Menu.new
  end

  def index
    @menus = Menu.all.page(params[:page]).per(5)
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
     redirect_to admin_menu_path(@menu)
     flash[:notice] = "新規登録確認しました。"
    else
      render:new
    end

  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])

    if @menu.update(menu_params)
     redirect_to admin_menu_path(@menu.id)
     flash[:notice] = "変更を保存しました。"
    else
      render:edit
    end

  end

  private

  def menu_params
    params.require(:menu).permit(:genre_id, :name, :info,:non_tax_price, :is_sale, :image)
  end

end
