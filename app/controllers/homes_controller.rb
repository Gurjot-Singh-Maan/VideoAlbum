class HomesController < ApplicationController
  def index
    @homes = VideoAlbum.where(publish: true)
    @q = @homes.ransack(params[:q])
    @homes = @q.result(distinct: true)
  end
end
