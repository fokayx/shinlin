class Photo < ActiveRecord::Base
  mount_uploader :image, PhotoUploader
  
  belongs_to :product

end
