require 'spec_helper'

describe PhotosController do

	describe 'get show' do
		it 'should assign photo to @photo' do
			photo = FactoryGirl.create(:photo)
			get :show, id: photo.id
			assigns(:photo).should eq(photo) #:photo is @photo so it tests  PhotoController
		end
	end

	describe 'put update' do
		it 'should update photo params' do
			photo = FactoryGirl.create(:photo)
			put :update, id: photo.id, photo:{photo_name: "classroom"}
			assigns(:photo).photo_name.should eq("classroom")
		end
	end


end