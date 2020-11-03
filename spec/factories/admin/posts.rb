# frozen_string_literal: true

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

FactoryBot.define do
  factory :admin_post, class: 'Admin::Post' do
    titulo { Faker::Lorem.sentence }
    activo { false }
    slug { Faker::Lorem.sentence }
    contenido { 'MyText' }
    association :post_category, factory: :post_category
    association :post_category, factory: :admin_post_category

    trait :post_category_existente do
      post_category { nil }
      post_category_id { PostCategory.all.pluck(:id).sample }
    end

    trait :post_category_existente do
      post_category { nil }
      post_category_id { Admin::PostCategory.all.pluck(:id).sample }
    end
  end
end
