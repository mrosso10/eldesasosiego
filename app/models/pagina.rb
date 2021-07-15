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

  LONGITUD_MINIMA = 5

  has_many :candidatos

  def generar_candidatos
    texto.split("\n").select { |pag| pag.length > LONGITUD_MINIMA }.each do |oracion|
      Candidato.create!(texto: oracion, pagina: self, longanismo: oracion.length, tuiteable: 0)
    end
  end

  def to_s
    "Pág. #{numero}"
  end
end
