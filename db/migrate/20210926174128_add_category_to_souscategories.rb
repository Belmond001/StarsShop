class AddCategoryToSouscategories < ActiveRecord::Migration[6.1]
  def change
    add_reference :souscategories, :category, null: false, foreign_key: true
  end
end
