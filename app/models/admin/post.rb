# == Schema Information
#
# Table name: admin_posts
#
#  id                     :bigint           not null, primary key
#  activo                 :boolean
#  contenido              :text
#  deleted_at             :datetime
#  slug                   :string
#  titulo                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  actualizado_por_id     :bigint
#  admin_post_category_id :bigint           not null
#  creado_por_id          :bigint
#
# Indexes
#
#  index_admin_posts_on_actualizado_por_id      (actualizado_por_id)
#  index_admin_posts_on_admin_post_category_id  (admin_post_category_id)
#  index_admin_posts_on_creado_por_id           (creado_por_id)
#
# Foreign Keys
#
#  fk_rails_...  (actualizado_por_id => users.id)
#  fk_rails_...  (admin_post_category_id => admin_post_categories.id)
#  fk_rails_...  (creado_por_id => users.id)
#

class Admin::Post < ApplicationRecord
  audited
  acts_as_paranoid without_default_scope: true

  belongs_to :post_category, class_name: 'Admin::PostCategory', foreign_key: "admin_post_category_id"

  belongs_to :creado_por, optional: true, class_name: 'User'
  belongs_to :actualizado_por, optional: true, class_name: 'User'

  def to_s
    titulo
  end
end
