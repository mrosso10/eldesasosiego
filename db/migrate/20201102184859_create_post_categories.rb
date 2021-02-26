# generado con pg_rails

class CreatePostCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :post_categories do |t|
      t.string :nombre


      t.references :creado_por, index: true
      t.references :actualizado_por, index: true


      t.datetime :deleted_at

      t.timestamps
    end


    add_foreign_key :post_categories, :users, column: 'creado_por_id'
    add_foreign_key :post_categories, :users, column: 'actualizado_por_id'
  end
end
