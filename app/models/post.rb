# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id                 :bigint           not null, primary key
#  activo             :boolean
#  contenido          :text
#  deleted_at         :datetime
#  slug               :string
#  titulo             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  actualizado_por_id :bigint
#  creado_por_id      :bigint
#  post_category_id   :bigint           not null
#
# Indexes
#
#  index_posts_on_actualizado_por_id  (actualizado_por_id)
#  index_posts_on_creado_por_id       (creado_por_id)
#  index_posts_on_post_category_id    (post_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (actualizado_por_id => users.id)
#  fk_rails_...  (creado_por_id => users.id)
#  fk_rails_...  (post_category_id => admin_post_categories.id)
#

class Post < ApplicationRecord
  audited
  extend FriendlyId
  friendly_id :slug, use: :slugged

  acts_as_paranoid without_default_scope: true

  belongs_to :post_category, class_name: 'PostCategory'

  belongs_to :creado_por, optional: true, class_name: 'User'
  belongs_to :actualizado_por, optional: true, class_name: 'User'

  validates_presence_of :titulo, :slug, :contenido

  scope :activos, -> { without_deleted.where(activo: true) }

  def to_s
    titulo
  end
end
