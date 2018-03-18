class Klass < ActiveRecord::Base
	has_many :user_klasses
	has_many :users, through: :user_klasses
	include Slugify::InstanceMethod
	extend Slugify::ClassMethod
end