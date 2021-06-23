# frozen_string_literal: true

# == Schema Information
#
# Table name: paginas
#
#  id         :bigint           not null, primary key
#  numero     :integer
#  texto      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pagina < ApplicationRecord
  audited

  has_many :candidatos
end
