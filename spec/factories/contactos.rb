# == Schema Information
#
# Table name: contactos
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  ip         :string           not null
#  mensaje    :string           not null
#  nombre     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_contactos_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :contacto do
    nombre { Faker::Lorem.sentence }
    email { Faker::Lorem.sentence }
    mensaje { Faker::Lorem.sentence }
    ip { Faker::Lorem.sentence }
    association :user, factory: :user

    trait :user_existente do
      user { nil }
      user_id { User.all.pluck(:id).sample }
    end
  end
end
