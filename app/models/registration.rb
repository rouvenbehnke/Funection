class Registration < ActiveRecord::Base
	before_create :default_state_value

	enum parts: [:part1, :part2, :part1_and_part2]
	enum acqu: [:ja, :nein]
	enum state: [:created, :confirmed, :declined, :accepted, :reserved]

	def default_state_value
		self.state = 0
	end
end



