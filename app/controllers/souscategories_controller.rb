class SouscategoriesController < ApplicationController
    before_action :set_souscategory , only: [:edit,:show,:update,:destroy]

    def index
        @sous_categories= Souscategory.includes(:category).all
    end 
   
    def new
    @sous_category=Souscategory.new()
    end

    def create
        @sous_category=Souscategory.new(params_sous_category)
        if @sous_category.save
            flash[:success]="Your sous category was created with success!" 
            redirect_to souscategory_path(@sous_category)
        else
            flash[:danger]="Sorry but Error was expected, please try again!" 
            redirect_to new_souscategory_path
        end
    end  
    
    def show 
        
    end
    
    def edit
        
    end    

    def update
        
        if @sous_category.update(params_sous_category)
            flash[:success]="sous category update with success!"
            redirect_to souscategory_path(@sous_category)
        else
            flash[:danger]= "Sorry but Error was expected, please try again!"
            render 'edit'
        end       
    end

    def destroy
        
        if @sous_category.destroy
            flash[:success]="sous category delete with success!"
            redirect_to souscategories_path
        else
            flash[:danger]="sous category not deleted, an error was expected!"
        end       

    end
    private def params_sous_category
        params.require(:souscategory).permit(:sous_cat_libelle,:category_id)
    end    
    

    def set_souscategory
        @sous_category=Souscategory.find(params[:id])
    end    
end