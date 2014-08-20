# holds card objects in the same place initially
# moves cards to a "used" pile as game progresses

require_relative 'csv_handler'

class Deck
	attr_reader :used_cards, :new_cards
	def initialize
		@new_cards 	= []
		@used_cards = []
	end

	def add_cards(cards)
		@new_cards = cards
	end

	def has_unguessed_cards?
		!new_cards.empty?
	end

	def select_random
		card = new_cards.shuffle!.pop
		move_to_used_deck(card)
		card
	end

	def move_to_used_deck(card)
		used_cards << card
	end
end
