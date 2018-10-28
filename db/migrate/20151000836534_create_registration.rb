class CreateRegistration < ActiveRecord::Migration
  def up
    create_table :registrations do |t|
    	t.string :first_name
      t.string :last_name
      t.string :email
      t.string :fav_song
      t.integer :acqu, default: 1
      t.string :acquaintance
      t.string :fav_song
      t.string :questions
      t.timestamps
    end
  end
end
