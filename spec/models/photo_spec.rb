require 'spec_helper'

describe Photo do


	it 'should be scopable for the past week' do
		p1 = FactoryGirl.create(:photo, date: 3.days.ago) #Photo.new photo_name: "First photo", date: 3.days.ago
		p2 = FactoryGirl.create(:photo, date: 2.weeks.ago) #Photo.new photo_name: "Second photo", date: 2.weeks.ago
		p1.save
		p2.save

		Photo.past_week.should eq([p1])
	end
end