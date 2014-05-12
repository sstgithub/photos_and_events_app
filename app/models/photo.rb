class Photo < ActiveRecord::Base
	# attr_reader :gallery_id, :name, :image, :remote_image_url
	belongs_to :event
	has_and_belongs_to_many :tags
	mount_uploader :image, ImageUploader

	has_many :comments, as: :commentable

	scope :past_week, -> { where('date > ?', 1.week.ago)}

	# has_many :comments
	# accepts_nested_attributes_for :comments
end
