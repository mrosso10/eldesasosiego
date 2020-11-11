# generado con pg_rails

class CreateContactos < ActiveRecord::Migration[6.0]
  def change
    create_table :contactos do |t|
      t.string :nombre, null: false
      t.string :email, null: false
      t.string :mensaje, null: false
      t.string :ip, null: false
      t.references :user, foreign_key: true


      t.timestamps
    end

  end
end
