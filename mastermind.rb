

class Mastermind
  def initialize
    @answer = create_answer
    @guess_number = 12
    @winner = false
  end

# this takes user input and determines if it's valid or invalid or the actual code (winner) #
# it also determines how many attempts left and displays to player #   

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

# method for guessing the code and what happens after  #

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

# method for the end of game / different messages for winner or loser #

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

# gives player option to restart the game at the end #

  def restart_game?(input)
    case input
    when "y"
      true
    when "n"
      false
    end
  end

# creates code for player to break #

  def create_code
    code = []
    until code.size == 4 do
      number = (rand(6) + 1).to_s
      code << number unless code.include?(number)
    end
    code
  end

# Checks to see if entry is valid #

  def guess_is_vaild?(input)
    if input.size == 4 && input.all? { |e| "123456".include? (e) }
      return true
    else
      return false
    end
  end

  def get_y(number)
    
