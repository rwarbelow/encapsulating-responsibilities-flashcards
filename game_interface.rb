# runs a loop to start the game
# asks deck for card
# gets user input
# compares user input to answer
# hands result to display


#### doesn't care about...
# how the deck selects the card
# how the csv is parsed into cards

require_relative 'deck'
require_relative 'display'
require_relative 'guess_checker'
require_relative 'csv_handler'

class Game
	attr_reader :display, :deck, :guess_checker, :csv_handler
	def initialize
		@display 				= Display.new
		@guess_checker 	= GuessChecker.new
		@csv_handler 		= CSVHandler.new
		@deck 					= Deck.new
	end

	def run
		display.welcome
		load_card_file
		game_loop
		display.exit
	end

	def game_loop
		while deck.has_unguessed_cards?
			card = get_next_card_from_deck
			deck.move_to_used_deck(card)
			display.show_definition(card.definition)
			guess_loop(card)
			display.correct_guess(card)
		end
	end

	def guess_loop(card)
		guess 	= get_input_from_user
		until guess_checker.guess_correct?(card, guess)
			display.incorrect_guess
			guess = get_input_from_user
		end
	end

	def get_input_from_user
		gets.strip.downcase
	end

	def load_card_file
		display.ask_for_file
		file 			= verify_file_name(get_input_from_user)
		new_cards = csv_handler.create_card_array(file)
		deck.add_cards(new_cards)
		display.confirm_file(file)
	end

	def get_next_card_from_deck
		deck.select_random
	end

	def verify_file_name(input)
		file 		= input.gsub(".csv","") + ".csv"
		until File.exist?(file)
			display.nonexistant_file(file)
			file 	= verify_file_name(get_input_from_user)
		end
		file
	end
end


game = Game.new
game.run
