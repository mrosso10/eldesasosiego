# frozen_string_literal: true

# generado con pg_rails

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
