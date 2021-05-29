# generado con pg_rails

class CreatePaginas < ActiveRecord::Migration[6.1]
  def change
    create_table :paginas do |t|
      t.string :texto
      t.integer :numero


      t.timestamps
    end

  end
end
