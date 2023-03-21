class CommentsController < ApplicationController

def create
    @videoalbum= VideoAlbum.find(params[:video_album_id])
    @comment = @videoalbum.comments.create(comment_params)
    redirect_to video_album_path(@videoalbum)
    @comment.save   

end
def destroy
    @videoalbum = VideoAlbum.find(params[:video_album_id])
    @comment = @videoalbum.comments.find(params[:id])
    @comment.destroy
    redirect_to video_album_path(@videoalbum)
  end

def edit
   @videoalbum = VideoAlbum.find(params[:video_album_id])
   @comment = @videoalbum.comments.find(params[:id])
end

def update
   @videoalbum = VideoAlbum.find(params[:video_album_id])
   @comment = @videoalbum.comments.find(params[:id])

   if @comment.update(comment_params)
      redirect_to video_album_path(@videoalbum)
   else
      render :edit
   end
end

   

private 
   def comment_params
      params.require(:comment).permit(:commenter, :body)
   end
end

