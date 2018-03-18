module Slugify
	extend ActiveSupport::Concern
	
	module InstanceMethod
	
		def slug 
			if self.class == Klass || self.class == Assignment
				self.name.downcase.split(" ").join("-")
			else
			slug_string = self.first_name.downcase + "-" + self.last_name.downcase
			end
		end

		def name_join
			self.first_name + " " + self.last_name
		end 

	end

	module ClassMethod
		def find_by_slug(slug)
			self.all.detect do |instance|
				instance.slug == slug	
			end
		end
	end
	
end