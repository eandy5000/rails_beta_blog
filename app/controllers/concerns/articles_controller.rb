class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end
    
    def create
    @article = Article.new(article_params)
  
    
        if @article.save
            flash[:notice] = "Article was Saved"
            redirect_to article_path(@article)
         
            
            else
            #render :new or 
            render 'new'
        end
  
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update

    @article = Article.find(params[:id])
        if @article.update(article_params)

        flash[:notice] = "Article was successfully updated"
        redirect_to article_path(@article)

        else
            render 'edit'

        end

    end
    
    def index
        #in this case use @articles
        @articles = Article.all
        
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article was successfully deleted"
        redirect_to articles_path
    end
    
    private
    
    def article_params
    #gets the title and description parameters from article
    params.require(:article).permit(:title, :description)
    end
    
end
