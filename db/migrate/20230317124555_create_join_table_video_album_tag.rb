class CreateJoinTableVideoAlbumTag < ActiveRecord::Migration[7.0]
  def change
    create_table :tags_video_albums  do |t|
      t.bigint :video_album_id
      t.bigint :tag_id
    end
  
    add_index :tags_video_albums, :video_album_id
    add_index :tags_video_albums, :tag_id
  end
end
