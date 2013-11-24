class Photo < ActiveRecord::Base
  self.per_page = 30
  mount_uploader :photo, PhotoUploader
end
