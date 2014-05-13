class PhotosController < ApplicationController

	def index
		@photos = Photo.all
	end

	def show
		@photo = Photo.find(params[:id])
		@new_tag = @photo.tags.build
		@new_comment = @photo.comments.build
	end


	def new
		@new_photo = Photo.new(event_id: params[:event_id])
	end

	def create
		@new_photo = Photo.new(photo_params)
		if @new_photo.save
			redirect_to photos_path
		else
			redirect_to photo_path
		end
	end


	def edit
		@photo = Photo.find(params[:id]) #just finds it and shows it on webpage
		@new_tag = @photo.tags.build
		@new_comment = @photo.comments.build#(commentable_type: "Photo")
	end

	def update
		@photo = Photo.find(params[:id])
		if @photo.update_attributes(photo_params)
		# if @photo.tags.update_attributes(params[:id])
			redirect_to photos_path
		else
			redirect_to photos_path
		end
	end


	def destroy
		@photo = Photo.find(params[:id])
		if @photo.destroy
			redirect_to photos_path
		else
			redirect_to photo_path
		end
	end



	private

	def photo_params
		# params.require(:photo).permit!
		params.require(:photo).permit(:photo_name, :date, :image, comments_attributes:[:content])
		# params.permit(:photo, :name, comments_attributes:[:content])
	end
end