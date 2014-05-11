class TagsController < ApplicationController
	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end


	def new
		@new_tag = Tag.new
	end

	def create
		@new_tag = Tag.where(tag_params).first_or_create
		@photo = Photo.find(params[:photo_id])
		if @new_tag.save
			@photo.tags << @new_tag unless @photo.tags.exists?(@new_tag)
			redirect_to :back
		else
			redirect_to new_tag_path
		end
	end


	def edit
		@tag = Tag.find(params[:id])
	end

	def update
		@tag = Tag.find(params[:id])
		if @tag.update_attributes(params[:id])
			redirect_to tags_path
		else
			redirect_to tag_path
		end
	end


	def destroy
		@tag = Tag.find(params[:id])
		if @tag.destroy
			redirect_to tags_path
		else
			redirect_to tag_path
		end
	end

	private

	def tag_params
		params.require(:tag).permit(:name)
	end
end
