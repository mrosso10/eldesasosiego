# frozen_string_literal: true

# == Schema Information
#
# Table name: post_categories
#
#  id                 :bigint           not null, primary key
#  deleted_at         :datetime
#  nombre             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  actualizado_por_id :bigint
#  creado_por_id      :bigint
#
# Indexes
#
#  index_post_categories_on_actualizado_por_id  (actualizado_por_id)
#  index_post_categories_on_creado_por_id       (creado_por_id)
#
# Foreign Keys
#
#  fk_rails_...  (actualizado_por_id => users.id)
#  fk_rails_...  (creado_por_id => users.id)
#

class PostCategory < ApplicationRecord
  audited
  acts_as_paranoid without_default_scope: true

  belongs_to :creado_por, optional: true, class_name: 'User'
  belongs_to :actualizado_por, optional: true, class_name: 'User'

  has_many :posts, class_name: 'Post', foreign_key: 'post_category_id'
end
