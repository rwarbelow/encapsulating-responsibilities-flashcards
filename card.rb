# should know its word
# should know its definition

class Card
	attr_reader :id, :word, :definition
	def initialize(data)
		@id 				= data[:id]
		@word 			= data[:word].downcase
		@definition = data[:definition].downcase
	end
end
