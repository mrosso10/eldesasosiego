# frozen_string_literal: true

class ApplicationUploader < CarrierWave::Uploader::Base
  if Rails.env.production?
    storage :aws
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*_args)
    path = "fallback/#{[version_name, default_file].compact.join('_')}"
    ActionController::Base.helpers.asset_path(path)
  end

  def extension_white_list
    %w[jpg jpeg gif png]
  end

  protected

    def default_file
      'portada_post.jpg'
    end
end
