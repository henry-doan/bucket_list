class CommontatorComment < ActiveRecord::Base
	def display
	  creator = User.find(self.creator_id)
		"Comment By: #{creator.email} \n Body: #{self.body}"
	end
end