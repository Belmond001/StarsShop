class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name_post
      t.text :content_post
      t.float:price_post
      t.string :image_post_data
      t.string :Etat_post
      t.timestamps
    end
  end
end
