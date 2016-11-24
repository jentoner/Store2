# encoding: utf-8
# Class that uploads images
class ImageUploader < CarrierWave::Uploader::Base
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  #  storage :fog

  # Include RMagick or MiniMagick support:
  include CarrierWave::MiniMagick

  version :resized do
    # returns an image with a maximum width of 100px
    # while maintaining the aspect ratio
    # 10000 is used to tell CW that the height is free
    # and so that it will hit the 100 px width first
    process resize_to_fit: [300, 100_00]
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_limit: [200, 200]
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
