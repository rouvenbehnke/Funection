class AddStateToRegistration < ActiveRecord::Migration
  def change
  	add_column :registrations, :state, :integer
  end
end