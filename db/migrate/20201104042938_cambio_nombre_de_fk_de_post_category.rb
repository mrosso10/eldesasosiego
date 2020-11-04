class CambioNombreDeFkDePostCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :admin_posts, :admin_post_category_id, :post_category_id
  end
end
