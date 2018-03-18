module Slugify
	extend ActiveSupport::Concern
	
	module InstanceMethod
	
		def slug 
			if self.username
				self.username.downcase.split(" ").join("-")
			else
				self.name.downcase.split(" ").join("-")
			end
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