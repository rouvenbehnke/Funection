class AddQuestionsToRegistraion < ActiveRecord::Migration
  def up
    add_column :registrations, :questions, :string
  end
end
