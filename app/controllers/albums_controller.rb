class AlbumsController < ApplicationController
  before_action :album_find, except: [:index, :new, :create]
  def index
    @albums = Album.includes(:user)
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to album_path(@album)
    else
      render :edit
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :caption, :image).merge(user_id: current_user.id)
  end

  def album_find
    @album = Album.find(params[:id])
  end
end
