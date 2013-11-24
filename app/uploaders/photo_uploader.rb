class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  process :resize_to_fit => [2496, 1664]

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [305, 305]
  end

  version :detail do
    process :resize_to_fit => [960, 960]
  end

  # Extension whitelist
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
