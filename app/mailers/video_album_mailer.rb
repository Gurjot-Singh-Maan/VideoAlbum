class VideoAlbumMailer < ApplicationMailer

  default from: 'gurjotmaan@gmail.com'

  def send_video_upload_notification

  @user = params[:user]
  
  mail(to: @user.email, subject: "Video uploaded..")
  end


  def send_video_delete_notification

    @user = params[:user]
    mail(to: @user.email, subject: "Video Delete..")
    end

end


