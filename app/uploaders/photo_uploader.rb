class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "photo/#{model.id}"
  end

  def filename
    'img.jpg'
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [610, 610]
    process :quality => 95
  end

  version :detail do
    process :resize_to_fit => [1920, 1920]
    process :quality => 95
  end

  # Extension whitelist
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
