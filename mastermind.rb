##### Things that I need to do for Mastermind game ######
# Lay out rules of engagement (rules for the game) #
# Make sure to assume the computer is the one to randomly select the 4 digit number (Just at first) #
# Let player choose to be codebreaker (the one to guess the code) #
# Or let player choose to be the code chooser (person who chooses 4 colors or numbers) #
# Make sure the program gives the proper feedback (if correct and in the right spot or if just correct) to the codebreaker #
# Something to figure out if the game has been completed successfully #
# Give message at end for either winning or loosing player #
# After getting game to work, go back and make so computer makes choice on who does what role #
# Try to implement a strategy for the computer to follow #

module OnePlayerMode
  def create
    Array.new(4) { rand(1..6) }
  end

  def starting_message
    puts 'Please enter a number 4 digits long with the numbers being only 1-6.'    
  end
  def losers_end_message
    puts 'Sorry you ran out of tries without breaking the code.  Please try again.'
  end

  def winners_end_message
    puts 'Way to go! You broke the code!  I see a job at the NSA in you future!'
  end

  def secret_numbers(secrets)
    puts "The secret code was #{secrets}"
  end

  def guess_attempts_array
    i = 0
    guesses = []
    position = %w[one two three four]
    while i < 4
      puts "Please guess the #{position[i]} number:"
      guesses << gets.to_i
      i += 1
    end
    puts "Your guesses = #{guesses}"
  end
    
  def clues(correct, almost)
    puts "● #{correct} correct number in the correct position."
    puts "⦿ #{almost} correct number in the wrong part of town."
  end

  def check(secrets, guesses)
    correct = 0
    almost = 0
    guesses.each_index do |i|
      correct += 1
      elsif guesses.include?(secrets[i])
        almost += 1
      end
    end
    clues(correct, almost)
    correct == 4
  end
end

# Classes that will build out the play for the computert to pick four random numbers #

class PLayersGuess
  include OnePlayerMode
  attr_accessor :turn

  def initialize
    say_guess
    @turn = 0
  end

  def game_play
    secrets = create
    while turn = guess_keeper
      if !compare(secrets, guesses)
        @turn += 1
      else
        break
      end
    end

    # If it breaks from while loop this whill see why #

    if turn < 12
      winners_end_message
    else
      losers_end_message
      secret_numbers
    end
  end
end

