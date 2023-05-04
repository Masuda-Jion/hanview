class Admin::GenresController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    
    # 新規登録完了時の処理
    if @genre.save
     flash[:notice] = "新規登録完了しました。"
     redirect_to admin_genres_path
    else
     @genres = Genre.all
     render:index
    end
    
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    
    # ジャンルの編集時の処理
    if @genre.update(genre_params)
     flash[:notice] = "変更を保存しました。"
     redirect_to admin_genres_path
    else
     render:edit
    end
  
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
