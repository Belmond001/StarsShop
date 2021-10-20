class BoutiquesController < ApplicationController
    def accueil
      categories
      @posts=Post.all
      liste_categories
    end 
     
    def categories
      sous_categories
      @category=Category.all
    end

   def sous_categories
      @sous_category=Souscategory.all
   end  
    
   def liste_categories
      @tableau=[]
      @tableau=@tableau.push("Tous")
      @category.each do |category|
        @tableau=@tableau.push(category.cat_libelle)
      end 
      return @tableau
   end 

end    