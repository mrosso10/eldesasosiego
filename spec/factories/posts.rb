# frozen_string_literal: true

# == Schema Information
#
# Table name: admin_posts
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
#  index_admin_posts_on_actualizado_por_id  (actualizado_por_id)
#  index_admin_posts_on_creado_por_id       (creado_por_id)
#  index_admin_posts_on_post_category_id    (post_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (actualizado_por_id => users.id)
#  fk_rails_...  (creado_por_id => users.id)
#  fk_rails_...  (post_category_id => admin_post_categories.id)
#

FactoryBot.define do
  factory :post, class: 'Post' do
    titulo { Faker::Lorem.sentence }
    activo { Faker::Boolean.boolean }
    slug { Faker::Lorem.word }
    contenido do
      (1..5).map { Faker::Lorem.paragraph(sentence_count: 30) }.join('<br><br><br>')
    end
    association :post_category, factory: :post_category

    trait :post_category_existente do
      post_category { nil }
      post_category_id { PostCategory.all.pluck(:id).sample }
    end
  end
end
