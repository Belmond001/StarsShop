class CreateCategory < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :cat_libelle

      t.timestamps
    end
  end
end
