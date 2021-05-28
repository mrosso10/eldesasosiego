# == Schema Information
#
# Table name: candidatos
#
#  id         :bigint           not null, primary key
#  longanismo :integer
#  texto      :string
#  tipo_query :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Candidato < ApplicationRecord
end
