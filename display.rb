# prints welcome message
# prints instructions
# prints definition
# prints result of user input compared to answer


class Display
	def welcome
		puts "**Welcome to the flashcard app!**"
	end

	def ask_for_file
		puts "Which csv file would you like to use?"
	end

	def confirm_file(file)
		puts "Your cards from #{file} are loaded."
	end

	def show_definition(definition)
		puts "----"
		puts "Here is the definition: #{definition.capitalize}."
		printf "What is your guess?: "
	end

	def correct_guess(card)
		puts "Correct! #{card.word}: #{card.definition}"
	end

	def incorrect_guess
		printf "Wrong :( Take another guess: "
	end

	def nonexistant_file(file)
		printf "Sorry, #{file} does not exist. Enter another file name: "
	end

	def exit
		puts "You finished the game!"
		puts "See you later!"
	end
end
