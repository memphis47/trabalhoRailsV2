class Integrant < ActiveRecord::Base
	belongs_to :orchestra
	belongs_to :instrument
	attr_accessible :nome, :orchestra_id, :conductor_id, :instrument_id
end
