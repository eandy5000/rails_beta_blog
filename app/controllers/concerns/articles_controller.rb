class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end
    
    def create
    @article = Article.new(article_params)
  
    
        if @article.save
            flash[:notice] = "Article was Saved"
            redirect_to article_path(@article)
            #redirect_to article_path(@article)
            
            else
            #render :new or 
            render 'new'
        end
  
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    private
    
    def article_params
    #gets the title and description parameters from article
    params.require(:article).permit(:title, :description)
    end
    
end
