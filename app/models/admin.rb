class Admin < ActiveRecord::Base
	has_secure_password
	def slug 	
		slug_string = self.first_name.downcase + "-" + self.last_name.downcase
	end

	def name_join
		self.first_name + " " + self.last_name
	end 

	def self.find_by_slug(slug)
		self.all.detect do |instance|
			instance.slug == slug	
		end
	end

end