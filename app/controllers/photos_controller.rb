class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = "写真を新規投稿しました"
      redirect_to :photos
    else
      render "new"
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      flash[:success] = "PHOTO IDが「#{@photo.id}」の情報を更新しました"
      redirect_to :photos
    else
      render "edit"
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:success] = "photoを削除しました"
    redirect_to :photos
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :user_id).merge(user_id: current_user.id)
  end
end
