class CategoriesController < ApplicationController
   
   before_action :set_category , only: [:edit,:show,:update,:destroy]
      def index
        @categories= Category.all

        respond_to do |format|
            format.html
            format.json {render json:@categories}
            format.xml {render xml:@categories}
         end  
      end 
   
      def new
       @category=Category.new()

       
       respond_to do |format|
        format.html
        format.json {render json:@category}
        format.xml {render xml:@category}
       end  

      end
   
      def create
           @category=Category.create(params_category)
           if @category.save
               flash[:success]="Your category was created with success!" 
               redirect_to category_path(@category)
           else
               flash[:danger]="Sorry but Error was expected, please try again!" 
               redirect_to new_category_path
           end

                
            respond_to do |format|
                format.html
                format.json {render json:@category}
                format.xml {render xml:@category}
            end  
       end  
       
       def show 
            
            respond_to do |format|
                format.html
                format.json {render json:@category}
                format.xml {render xml:@category}
            end  
       end
       
       def edit
             
            respond_to do |format|
                format.html
                format.json {render json:@category}
                format.xml {render xml:@category}
            end   
       end    
   
       def update
           
           if @category.update(params_category)
               flash[:success]="category update with success!"
               redirect_to category_path(@category)
           else
               flash[:danger]= "Sorry but Error was expected, please try again!"
               render 'edit'
           end  
           
           
            
            respond_to do |format|
                format.html
                format.json {render json:@category}
                format.xml {render xml:@category}
            end  
       end
   
       def destroy
           
           if @category.destroy
               flash[:success]="category delete with success!"
               redirect_to categories_path
           else
               flash[:danger]="category not deleted, an error was expected!"
           end       
            
            respond_to do |format|
                format.html
                format.json {render json:@category}
                format.xml {render xml:@category}
            end  
       end

       private def params_category
           params.require(:category).permit(:cat_libelle)
       end    
       def set_category
        @category=Category.find(params[:id])
       end 
end    