class ChangeNameToPhotoNameInPhotos < ActiveRecord::Migration
  def change
  	rename_column :photos, :name, :photo_name
  end
end
