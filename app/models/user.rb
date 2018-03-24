class User < ActiveRecord::Base
	has_many :comments
	has_many :user_klasses
	has_many :klasses, through: :user_klasses
	has_many :user_assignments
	has_many :assignments, through: :user_assignments
	has_secure_password
	validates_presence_of :username, :email, :password
	include Slugify::InstanceMethod
	extend Slugify::ClassMethod
end