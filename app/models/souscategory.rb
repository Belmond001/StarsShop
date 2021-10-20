class Souscategory < ApplicationRecord
   validates :sous_cat_libelle, presence:{message:" ne dois pas etre vide!, "}, uniqueness:true
   belongs_to :category
end    