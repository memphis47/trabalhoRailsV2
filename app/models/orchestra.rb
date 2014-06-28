class Orchestra < ActiveRecord::Base
	has_one :conductor, foreign_key: "conductor_id"
	has_many :instruments, :through => :integrants 
	has_many :integrants
	attr_accessible :name, :city, :conductor_id
end
