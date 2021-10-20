class Post < ApplicationRecord
    belongs_to :souscategory
    validates :name_post,:Etat_post,:image,:content_post, :price_post,presence:{message:" ne dois pas etre vide!, "},uniqueness:true
    include ImageUploader::Attachment.new(:image)
   
end    

