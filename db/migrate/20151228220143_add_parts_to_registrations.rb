class AddPartsToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :parts, :integer
  end
end
