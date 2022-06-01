# frozen_string_literal: true

class Game
  def initialize
    puts '
    ---------------------------------'
    puts '
    Welcome to CodeBreaker'
    puts '
    The game is simple!  Do you want to be the Codebreaker or code maker? 
    The Codebreaker will have 12 guesses to break the computers code.
    The code maker will pick a 4 digit number consisting of the numbers 1..6.'
    puts '
    After each attempt you will be given clues.
    One clue will tell if you have correct number in correct position.
    The second clue is if you have right number but wrong position.'
    puts '
    The letter "X" indicates one of the numbers you guessed is in the correct position. 
    The letter "x" indicates you guessed a correct number but it is NOT in the correct 
    position'
    puts '
    ----------------------------------'
    @game_over = false
    @turn = 1
    until @computer_guesser === 'Y' || @computer_guesser === 'N'
      print 'Is the code maker? Y/N
      '
      @computer_guesser = gets.chomp.upcase
    end
    pick_game_mode
    sequence_order
  end

  def pick_game_mode
    if @computer_guesser == 'Y'
      human_code_generator
    else
      code_generator
    end
  end

  def code_generator
    @code = Array.new(4) { rand(1..6) }
  end

  def human_code_generator
    @code = ''
    puts 'Please enter a 4 digit code'
    @code = gets.chomp.each_char.map(&:to_i) until @code.length == 4
  end

  # computer_guesser method that tests if the computer's guess matches the human's
  # by iterating through the array, if a direct match ('H') is found it will keep that number in the next guess
  
  def computer_guesser
    @updated_computer_array = [' ', ' ', ' ', ' ']
    if @turn == 1
      @guess = Array.new(4) { rand(1..6) }
    else
      i = 0
      while i < 4
        @updated_computer_array[i] = @guess[i] if @guess[i] == @code[i]
        i += 1
      end
    end
    @guess = Array.new(4) { rand(1..6) }
    @updated_computer_array.each_with_index do |value, idx|
      @guess[idx] = value if value != ' '
    end
    puts "Guess: #{@guess.join}"
  end

  def codebreaker_guess
    @guess = []
    until @guess.length == 4
      puts 'Enter your 4 digit guess'
      @guess = gets.chomp.each_char.map(&:to_i)
      puts "Guess: #{@guess.join}"
      print "Your guess was not 4 digits long, please guess again \n" if @guess.length != 4
    end
  end

  def turn_display
    puts '-------------------------'
    puts "You've had this many attempts: #{@turn}"
  end

  # Repeats the following guess/check sequence for 12 turns
  # or until the code and guess are matched
  
  def sequence_order
    while @turn < 13 && @game_over == false
      turn_display
      if @computer_guesser == 'Y'
        computer_guesser
      else
        codebreaker_guess
      end
      guess_checker
      @turn += 1
      check_for_winner

    end
  end

  def guess_checker
    @guess_accuracy = []
    @i = 0
    @x_counter = 0
    while @i < 4
      if @guess[@i] == @code[@i]
        @guess_accuracy.push('X')
        @x_counter += 1
      end
      @i += 1
    end
    if @i == 4
      i = 0
      compare_array = @code.clone
      while i < 4
        if compare_array.include?(@guess[i])
          compare_array[compare_array.index(@guess[i])] = ' '
          @guess_accuracy.push('x')
        end
        i += 1
      end
      @guess_accuracy.pop(@x_counter)
      puts "Guess accuracy: #{@guess_accuracy.join}"
    end
  end

  def check_for_winner
    if @guess[0..3] == @code[0..3]
      puts "Code was guessed correctly, it's #{@code}, codebreaker wins"
      @game_over = true
    elsif @turn == 13 && @game_over == false
      puts 'Code was not guessed correctly, code maker wins'
      @game_over = true
    end
  end
end

game = Game.new
