class Blog < ApplicationRecord
  has_attached_file :image, styles: { cover: "1500x200>", thumb: "200x200>" }, default_url: "/missing-wide.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  belongs_to :user
end
