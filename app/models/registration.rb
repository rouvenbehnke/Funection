class Registration < ActiveRecord::Base
	before_create :default_state_value

	enum acqu: [:ja, :nein]
	enum state: [:created, :confirmed, :declined, :accepted]

	def default_state_value
		self.state = 0
	end
end



