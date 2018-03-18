class Assignment < ActiveRecord::Base
	belongs_to :klass
	has_many :user_assignments
	has_many :users, through: :user_assignments

	def slug 
		self.name.downcase.split(" ").join("-")	
	end

	def self.find_by_slug(slug)
			self.all.detect do |instance|
				instance.slug == slug	
			end
		end
end