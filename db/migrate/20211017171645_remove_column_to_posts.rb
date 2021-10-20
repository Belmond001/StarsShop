class RemoveColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :image_post_data
  end
end
