class CreatePhotosAndEvents < ActiveRecord::Migration
  def change

	  create_table :events do |t|
	    t.string :name
	    t.date   :date

	    t.timestamps
	  end

	  create_table :photos do |t|
	    t.string  	:name
	    t.integer 	:event_id
	    t.date			:date

	    t.timestamps
	  end

	  create_table :photos_tags, id: false do |t|
	    t.integer :photo_id
	    t.integer :tag_id
	  end

	  create_table :tags do |t|
	    t.string :name
	  end

  end
end
