class AddPublishToVideoAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :video_albums, :publish, :boolean, default: false

  end
end
