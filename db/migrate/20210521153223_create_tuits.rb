class CreateTuits < ActiveRecord::Migration[6.0]
  def change
    create_table :tuits do |t|
      t.string :texto

      t.timestamps
    end
  end
end
