# can take a csv file, parse it, and create objects from the rows
# returns an array of card objects to whatever called it

require 'csv'
require_relative 'card'

class CSVHandler
	def parse_csv(file)
		CSV.open(file, headers: true, header_converters: :symbol)
	end

	def create_cards(csv)
		csv.map { |row| Card.new(row) }
	end

	def create_card_array(file)
		csv = parse_csv(file)
		create_cards(csv)
	end
end
