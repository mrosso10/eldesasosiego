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
class Image < ApplicationRecord
  mount_uploader :file, ImageUploader
end
