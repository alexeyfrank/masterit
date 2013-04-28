# encoding: utf-8

class CoursePreviewUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file
  # storage :fog

  def store_dir
    "system/uploads/courses/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
     process :resize_to_fill => [300, 200]
  end
end
