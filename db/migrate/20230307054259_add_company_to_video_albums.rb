class AddCompanyToVideoAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :video_albums, :company, :string
  end
end
