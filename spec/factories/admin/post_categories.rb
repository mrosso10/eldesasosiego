# frozen_string_literal: true

# == Schema Information
#
# Table name: admin_post_categories
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
#  index_admin_post_categories_on_actualizado_por_id  (actualizado_por_id)
#  index_admin_post_categories_on_creado_por_id       (creado_por_id)
#
# Foreign Keys
#
#  fk_rails_...  (actualizado_por_id => users.id)
#  fk_rails_...  (creado_por_id => users.id)
#

FactoryBot.define do
  factory :admin_post_category, class: 'Admin::PostCategory' do
    nombre { Faker::Lorem.sentence }
  end
end
