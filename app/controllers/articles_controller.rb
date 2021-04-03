class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @articles = Article.paginate(page: params[:page], per_page: 10)
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            flash[:notice] = "Article Created Successfully"
            redirect_to article_path(@article)
        else
            render :new
        end
    end

    def show

    end

    def edit

    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article Updated Successfully"
            redirect_to article_path(@article)
        else
            render :edit
        end
    end

    def destroy
        @article.destroy
        flash[:notice] = "Article Destroyed Successfully"
        redirect_to articles_path
    end

    private
    def article_params
        params.require(:article).permit(:title, :description, :user_id)
    end

    def set_article
        @article = Article.find(params[:id])
    end

    def require_same_user
        if current_user != @article.user
            flash[:danger] = "You can only Edit/Delete articles that you wrote."
            redirect_to "/"
        end
    end
end