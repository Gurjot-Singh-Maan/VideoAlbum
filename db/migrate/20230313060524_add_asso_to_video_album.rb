class AddAssoToVideoAlbum < ActiveRecord::Migration[7.0]
  def change
    add_column :video_albums, :user_id, :integer
  end
end
