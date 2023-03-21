class VideoAlbumsController < ApplicationController
  
  before_action :authenticate_user!

  
  def index
   @videoalbums = current_user.video_albums
   @q = @videoalbums.ransack(params[:q])
   @videoalbums = @q.result(distinct: true)
  end
  
  def show
    @videoalbum = VideoAlbum.find(params[:id])
    @comment = Comment.new
  end
 

  def new
    @videoalbum = current_user.video_albums.new
    
  end


  def create

    @videoalbum = current_user.video_albums.new(video_params)

    if @videoalbum.save
      redirect_to root_path

      VideoAlbumMailer.with(user: current_user).send_video_upload_notification.deliver_now
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @videoalbum = VideoAlbum.find(params[:id])
  end

  def update
    @videoalbum = VideoAlbum.find(params[:id])
     
    if @videoalbum.update(video_params)
      redirect_to @videoalbum
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @videoalbum = VideoAlbum.find(params[:id])
    @videoalbum.destroy

    redirect_to root_path
    VideoAlbumMailer.with(user: current_user).send_video_delete_notification.deliver_now

  end

  private
    def video_params
      params.require(:video_album).permit(:title, :description, :cover, :video, :company, :publish, :user_id, :all_tags)
    end
end
