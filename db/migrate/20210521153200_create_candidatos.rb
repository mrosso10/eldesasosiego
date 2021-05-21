class CreateCandidatos < ActiveRecord::Migration[6.0]
  def change
    create_table :candidatos do |t|
      t.string :texto
      t.string :tipo_query
      t.integer :longanismo

      t.timestamps
    end
  end
end
