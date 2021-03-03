class CamposDeDiscard < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :deleted_at, :discarded_at
    rename_column :post_categories, :deleted_at, :discarded_at
  end
end
