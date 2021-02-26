# generado con pg_rails

class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :titulo
      t.boolean :activo
      t.string :slug
      t.text :contenido
      t.references :post_category, null: false, foreign_key: true

      t.references :creado_por, index: true
      t.references :actualizado_por, index: true


      t.datetime :deleted_at

      t.timestamps
    end

    add_foreign_key :posts, :users, column: 'creado_por_id'
    add_foreign_key :posts, :users, column: 'actualizado_por_id'
  end
end
