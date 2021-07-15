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
class Candidato < ApplicationRecord
  belongs_to :pagina
end
