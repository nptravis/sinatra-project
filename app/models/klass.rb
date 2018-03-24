class Klass < ActiveRecord::Base
	validates_presence_of :subject, :time_day, :weeks, :location, :description, :user_id
	has_many :user_klasses
	has_many :users, through: :user_klasses
	include Slugify::InstanceMethod
	extend Slugify::ClassMethod
end
