class GameController

  attr_accessor :name, :status, :correct_guesses, :incorrect_guesses
  attr_reader :word_object, :gallows_object, :guess_limit

  def initialize(num_players)
    #initialize attributes to track game progress
    @guess_limit = 6 #TODO: make customizable difficulty settings
    @correct_guesses = []
    @incorrect_guesses = []
    @status = []
    @gallows = self.get_gallows

    #Check game type and create word accordingly
    case num_players
    when 1
      @word_object = Word.new
    when 2
      ## TODO GET WORD FROM SECOND PLAYER
    when 3
      ## TODO HEAD TO HEAD MODE
    else
     puts "someone screwed up"
   end

   # Fill in status with blanks for letters in word
   self.update_status

   # Run game loop
   self.run_game
  end

  def word
    self.word_object.word
  end

  def word_array
    self.word.split("")
  end

  def get_guess
    puts "Please guess a letter:"
    STDIN.gets.chomp.downcase
  end

  def valid_letter?(guess)
    ("a".."z").to_a.include?(guess)
  end

  def check_guess(guess)
    while !valid_letter?(guess)
      puts "That is not a letter!"
      guess = self.get_guess
    end
    while correct_guesses.include?(guess) || incorrect_guesses.include?(guess)
      puts "You've already guessed that letter!"
      guess = self.get_guess
    end
    if self.word_array.include?(guess)
      self.correct_guesses << guess
    else
      self.incorrect_guesses << guess
    end
  end

  def update_status
    self.status.clear
    self.word_array.collect do |letter|
      if self.correct_guesses.include?(letter)
        status << letter
      else
        status << " _ "
      end
    end
  end

  def print_status
    puts "Status: #{self.status.join}"
  end

  def print_incorrect_guesses
    puts "Letters guessed: #{self.incorrect_guesses.join(", ")}"
  end

  def get_gallows
    @gallows_object = Gallows.new(1) #TODO: Make parameter an attribute of the GameController.gallows_option attribute??
    # @gallows = {0 => "zero wrong guesses", 1 => "one wrong guess", 2 => "two wrong guesses", 3 => "three wrong guesses"}
  end

  def print_word_length
    puts "Your word has #{self.word.length} letters."
  end

  def print_gallows(num_incorrect_guesses)
    puts self.gallows_object.gallows[num_incorrect_guesses]
  end

  def guess_limit_reached?
    self.incorrect_guesses.length == self.guess_limit ? true : false
  end

  def word_guessed?
    self.status.join.strip == self.word ? true : false
  end

  def clear_terminal
    system "clear"
  end

  def run_game
    # Print initial welcome messages to terminal
    self.clear_terminal
    puts "Welcome to a new game of Hangman!"
    puts "------------------------------"

    # Set game status
    game_over = false

    # Run through guessing loop
    while !game_over
      self.print_gallows(incorrect_guesses.length)
      self.print_word_length
      self.print_status
      self.print_incorrect_guesses
      guess = self.get_guess
      self.check_guess(guess)
      self.update_status
      if self.guess_limit_reached?
        self.print_gallows(incorrect_guesses.length)
        puts "GAME OVER DUMMY!"
        puts "The word was #{self.word}!"
        game_over = true
      elsif self.word_guessed?
        puts <<~heredoc
        ~~~~~~~~~~~~~~~~~~~~~~~~~
        CONGRATULATIONS, YOU WIN!
        ~~~~~~~~~~~~~~~~~~~~~~~~~

        "You correctly guessed that the word was: #{self.word}!"

        ------------------------------

        heredoc
        game_over = true
      else
        self.clear_terminal
      end
    end
  end
  #TODO: create method to ask user to start a new game or not? yes -> new game_controller instance; n -> return to main menu. Does this belong at bottom of run_game??
end
