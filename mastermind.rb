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

class Mastermind
  def initialize
    @answer = create_answer
    @guess_number = 12
    @winner = false
  end
  def ask_what_you_guess
    while @guess_number > 0 do
      break if @winner
      p "#{@guess_number.to_s.rjust(2)} attempts left: "
      input = gets.chomp.split("")
      if guess_is_vaild?(input)
        win = guess(input)
      else
        puts "Invalid input! Please try again!"
      end
    end
    
    game_over

  end

  def guess(number)
    if number == @answer
      @winner = true
    else
      x = get_x(number)
      y = get_y(number)
      puts "Please try again, #{x}X#{y}Y."
      @guess_number -= 1
    end
  end

  def game_over
    input = nil
    until ["y", "n"].include?(input)
      if @winner
        print "You won! Would you like to try again? [Y/N]"
      else
        print "You lose, this time!  Would you like to give it another try? [Y/N]"
      end
      input = gets.chomp.downcase
    end
    restart_game?(input)
  end

  def restart_game?(input)
    case input
    when "y"
      true
    when "n"
      false
    end
  end

  def