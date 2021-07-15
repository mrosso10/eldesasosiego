class AddTuiteableToCandidato < ActiveRecord::Migration[6.1]
  def change
  	add_column :candidatos, :tuiteable, :boolean
  end
end
