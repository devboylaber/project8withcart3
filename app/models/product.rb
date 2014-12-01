class Product < ActiveRecord::Base
  has_many :order_items
  has_attached_file :image, :styles => { :huge => "500x500>", :large => "400x400>", :medium => "300x300>", :small => "200x200>", :tiny => "100x100>" }, :defualt_url => "/images/:style/cool.jpg"
  validates_attachment_content_type :image || :slide_image, :content_type => /\Aimage\/.*\Z/  

  has_attached_file :slide_image, :styles => { :huge => "500x500>", :large => "400x400>", :medium => "300x300>", :small => "200x200>", :tiny => "100x100>" }, :defualt_url => "/slide_images/:style/cool.jpg"
  validates_attachment_content_type :slide_image || :image, :content_type => /\Aslide_image\/.*\Z/  

  default_scope { where(active: true) }
end