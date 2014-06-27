class Conductor < ActiveRecord::Base
	belongs_to:orchestra
	attr_accessible :name, :age 
end
