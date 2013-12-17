module CarrierWave
  module Uploader
    module Versions
      def fix_2x_name(name)
        name.to_s.gsub(/AT2x/, '@2x') if name
      end

      def full_filename(for_file)
        parent_name = super(for_file)
        ext         = File.extname(parent_name)
        base_name   = parent_name.chomp(ext)
        [base_name, fix_2x_name(version_name)].compact.join('_') + ext
      end

      def full_original_filename
        parent_name = super
        ext         = File.extname(parent_name)
        base_name   = parent_name.chomp(ext)
        [base_name, fix_2x_name(version_name)].compact.join('_') + ext
      end
    end
  end
end

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
    process :resize_to_fill => [305, 305]
    process :quality => 95
  end

  version :thumbAT2x do
    process :resize_to_fill => [610, 610]
    process :quality => 90
  end

  version :detail do
    process :resize_to_fit => [960, 960]
    process :quality => 95
  end

  version :detailAT2x do
    process :resize_to_fit => [1920, 1920]
    process :quality => 90
  end

  # Extension whitelist
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
