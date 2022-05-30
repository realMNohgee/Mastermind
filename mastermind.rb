##### Things that I need to do for Mastermind game ######
# Lay out rules of engagement (rules for the game) #
# Make sure to assume the computer is the one to randomly select the 4 digit number (Just at first) #
# Let player choose to be codebreaker (the one to guess the code) #
# Or let player choose to be the code chooser (person who chooses 4 colors or numbers) #
# Make sure the program gives the proper feedback (if correct and in the right spot or if just correct) to the codebreaker #
# Something to figure out if the game has been completed successfully #
# Give messaged at end for either winning or loosing #
# After getting game to work, go back and make so computer makes choice on who does what role #
# Try to implement a strategy for the computer to follow #

class MastermindGame 
  
  def initialize
    @user_play = false
    @computer_play = false
    @turn = 1
    @guesses = 0
    @good_guesses = []
    @clue_digit = 0
    @clue_position = 0
    @clue_add = true
    @one_timer = true
    start_game
  end

  def start_game
    puts "You Must crack the code that the AI will decide! Press 1 and enter to start.  Good Luck!"
    repsone = gets.chomp.to_f
    if repsone == 1
      @user_play = true
      start_users_game
      elsif repsone == 2
        @computer_play = true
        start_users_game
        else
          puts "Wrong selection! Please enter 1 to play."
          start_game
        end
      end



