class CreateImage < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :alt
      t.string :hint
      t.string :file

      t.timestamps
    end
  end
end
