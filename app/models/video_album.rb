class VideoAlbum < ApplicationRecord
  has_one_attached :cover
  has_one_attached :video
  validates_acceptance_of :cover, :content_type => ['cover/jpg', 'cover/webp', 'cover/jpeg']
  validates_acceptance_of :video, :content_type => ['video/mp4', 'video/ogg']
  validates :title, :description, :company, :cover, :video, presence: true
  validates :title, length: { in: 5..200 }
  validates :description, length: { minimum: 10 }
  validates :company, length: { in: 2..30 }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags


  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.ransackable_attributes(auth_object = nil)
    ["company", "created_at", "description", "id", "publish", "title", "updated_at", "user_id", "tags_name"]
  end


  def self.ransackable_associations(auth_object = nil)
    ["comments", "cover_attachment", "cover_blob", "tags", "user", "video_attachment", "video_blob", "tags_name"]
  end
  
end


