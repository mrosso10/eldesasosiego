# frozen_string_literal: true

# == Schema Information
#
# Table name: images
#
#  id         :bigint           not null, primary key
#  alt        :string
#  hint       :string
#  file       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Necesaria para el TinymceAssetsController
class Image < ApplicationRecord
  mount_uploader :file, ImageUploader
end
