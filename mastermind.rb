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
    puts 'Welcome to Code Breaker!
    
    Please enter a number 4 digits long with the numbers being only 1-6.
    
    You will be given clues for digits that are correct and for digits that are correct and in the correct position.

    You will have 12 chances to break the code.
    
    Good luck!'
  end

  def losers_end_message
    puts 'Sorry you ran out of tries without breaking the code.  Please try again.'
  end

  def winners_end_message
    puts 'Way to go! You broke the code!  I see a job at the NSA in you future!'
  end

  def secret_numbers
    puts 'The secret code was #{secret}'
  end

  

