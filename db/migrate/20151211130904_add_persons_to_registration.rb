class AddPersonsToRegistration < ActiveRecord::Migration
  def change
  	add_column :registrations, :persons, :integer
  end
end
