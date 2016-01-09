class Pin < ActiveRecord::Base
  validates_presence_of :title, :url, :slug, :text, :category_id
  validates_uniqueness_of :slug
  
  belongs_to :category

  has_attached_file :image, styles: { medium: "300x300>", thumb: "60x60>" }, default_url: "http://placebear.com/60/60"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
end