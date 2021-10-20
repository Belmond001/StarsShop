class Category < ApplicationRecord
    has_many :souscategories, dependent: :destroy
    has_many :posts ,dependent: :destroy
    validates :cat_libelle,presence:{message:" ne dois pas etre vide!, "},uniqueness:true
    
end    