class Integrant < ActiveRecord::Base
	belongs_to :orchestra , foreign_key: "orchestra_id"
	belongs_to :instrument, foreign_key: "instrument_id"
	attr_accessible :nome, :orchestra_id, :conductor_id, :instrument_id
end
