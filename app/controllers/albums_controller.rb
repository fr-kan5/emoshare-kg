class AlbumsController < ApplicationController
  before_action :album_find, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

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
    @comment = Comment.new
    @comments = @album.comments.includes(:user)
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

  def destroy
    if @album.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :caption, images: []).merge(user_id: current_user.id)
  end

  def album_find
    @album = Album.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @album.user
  end
end
