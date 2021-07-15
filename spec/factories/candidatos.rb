# frozen_string_literal: true

# == Schema Information
#
# Table name: candidatos
#
#  id         :bigint           not null, primary key
#  longanismo :integer
#  texto      :string
#  tipo_query :string
#  tuiteable  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pagina_id  :bigint
#
# Indexes
#
#  index_candidatos_on_pagina_id  (pagina_id)
#
# Foreign Keys
#
#  fk_rails_...  (pagina_id => paginas.id)
#

FactoryBot.define do
  factory :candidato do
    texto { Faker::Lorem.sentence }
    association :pagina, factory: :pagina
    longanismo { 1 }

    trait :pagina_existente do
      pagina { nil }
      pagina_id { Pagina.all.pluck(:id).sample }
    end
  end
end
