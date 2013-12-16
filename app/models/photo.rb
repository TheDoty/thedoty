class Photo < ActiveRecord::Base
  self.per_page = 30
  mount_uploader :photo, PhotoUploader

  def older
    Photo.where('id < ?', self.id).order('id DESC').first
  end

  def newer
    Photo.where('id > ?', self.id).order('id').first
  end
end
