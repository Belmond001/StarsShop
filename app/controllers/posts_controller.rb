class PostsController < ApplicationController
    before_action :set_post, only: [:edit,:show,:update,:destroy]
   
    def index
        @posts= Post.includes(:souscategory).all
        categories
        liste_categories

        respond_to do |format|
            format.html
            format.json {render json:@posts}
            format.xml {render xml:@posts}
        end   
    end 

    def new
        @post=Post.new()
        categories
        liste_categories
        respond_to do |format|
            format.html
            format.json {render json:@post}
            format.xml {render xml:@post}
        end  
    end

    def create
        @post= Post.create(params_post)
        if @post.save
            flash[:success]="Your post was created with success!" 
            redirect_to post_path(@post)
        else
            flash[:danger]="Sorry but Error was expected, please try again!" 
            redirect_to new_post_path
        end

        respond_to do |format|
            format.html
            format.json {render json:@post}
            format.xml {render xml:@post}
         end  
    end  
    
    def show 
        respond_to do |format|
            format.html
            format.json {render json:@post}
            format.xml {render xml:@post}
         end  
    end
    
    def edit

    end    

    def update
       
        if @post.update(params_post)
            flash[:success]="Post update with success!"
            redirect_to post_path(@post)
        else
            flash[:danger]= "Sorry but Error was expected, please try again!"
            render 'edit'
        end   
        
        
        respond_to do |format|
            format.html
            format.json {render json:@post}
            format.xml {render xml:@post}
         end  
    end

    def destroy
        categories
        liste_categories
        if @post.destroy
            flash[:success]="Post delete with success!"
            redirect_to posts_path
        else
            flash[:danger]="Post not deleted, an error was expected!"
        end       
        

        respond_to do |format|
            format.html
            format.json {render json:@post}
            format.xml {render xml:@post}
         end  
    end

    
    private def params_post
        params.require(:post).permit(:name_post,:content_post,:price_post,:Etat_post,:image,:souscategory,:souscategory_id)
    end    
    
    def set_post 
        @post=Post.find(params[:id])
    end  
    
    def liste_categories
        @tableau=[]
        @tableau=@tableau.push("Tous")
        @category.each do |category|
          @tableau=@tableau.push(category.cat_libelle)
        end 
        return @tableau
    end 

    def categories
        sous_categories
        @category=Category.all
    end
  
    def sous_categories
        @sous_category=Souscategory.all
    end  
      

end    