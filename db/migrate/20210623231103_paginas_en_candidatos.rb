class PaginasEnCandidatos < ActiveRecord::Migration[6.1]
  def change
    add_reference :candidatos, :pagina, foreign_key: true, index: true
  end
end
