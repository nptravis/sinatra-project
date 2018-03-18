class UserKlass < ActiveRecord::Base
	belongs_to :user 
	belongs_to :klass
end