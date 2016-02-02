class CommentsController < ApplicationController

	include ArticlesHelper
	def index
		@comments = Comment.all
	end
	def show
		@comment =  Comment.find(params[:id])
	end
	def new
		@article = Article.new
	end
	def create
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]
		@comment.save

		flash.notice = "Comment '#{@comment.body}' created!"
		redirect_to article_path(@comment.article)
	end
	def comment_params
		params.require(:comment).permit(:author_name, :body)
	end
	def destroy
		@comment= Comment.find(params[:id]).destroy

		flash.notice = "Comment '#{@comment.body}' deleted!"
		redirect_to articles_path
	end
	def edit
		@comment = Comment.find(params[:id])
	end
	def update
		@comment = Comment.find(params[:id])
		@comment.update(article_params)

		flash.notice = "Comment '#{@comment.body}' updated!"

		redirect_to article_path(@article)
	end

end

