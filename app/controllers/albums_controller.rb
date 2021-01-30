class AlbumsController < ApplicationController
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
    @album = Album.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def album_params
    params.require(:album).permit(:title, :caption, :image).merge(user_id: current_user.id)
  end
end
