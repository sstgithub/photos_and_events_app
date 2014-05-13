class CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find(params[:id])
	end


	def new
		@new_comment = Comment.new
	end

	def create
		@new_comment = Comment.where(comment_params).first_or_create
		if @new_comment.save
			redirect_to :back
		else
			redirect_to new_comment_path
		end
	end


	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update_attributes(params[:id])
			redirect_to comments_path
		else
			redirect_to comment_path
		end
	end


	def destroy
		@comment = Comment.find(params[:id])
		if @comment.destroy
			redirect_to comments_path
		else
			redirect_to comment_path
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:commentable_id, :commentable_type, :content)
	end
end
