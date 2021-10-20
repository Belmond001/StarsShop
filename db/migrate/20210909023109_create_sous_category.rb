class CreateSousCategory < ActiveRecord::Migration[6.1]
  def change
    create_table :souscategories do |t|
      t.text :sous_cat_libelle

      t.timestamps
    end
  end
end
