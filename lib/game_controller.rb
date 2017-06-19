class GameController

  attr_reader :word_object, :gallows_object, :board

  def initialize(num_players)

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

   # Create a new board instance and give it: instance of self, word object
   @board = Board.new(self, self.word_object)

   # Run game loop
   self.run_game
  end

  def get_gallows
    @gallows_object = Gallows.new(1) #TODO: Make parameter an attribute of the GameController.gallows_option attribute??
    # @gallows = {0 => "zero wrong guesses", 1 => "one wrong guess", 2 => "two wrong guesses", 3 => "three wrong guesses"}
  end

  def print_gallows(num_incorrect_guesses)
    puts self.gallows_object.gallows[num_incorrect_guesses]
  end

  def clear_terminal
    system "clear"
  end

  def run_game
    # Print initial welcome messages to terminal
    self.clear_terminal

    # Set game status
    game_over = false

    # Create initial status
    self.board.update_status

    # Run through guessing loop
    while !game_over
      self.print_gallows(self.board.incorrect_guesses.length)
      self.board.print_word_length
      self.board.print_status
      self.board.print_incorrect_guesses
      guess = Guess.get_guess
      self.board.check_guess(guess)
      self.board.update_status
      if self.board.guess_limit_reached?
        self.print_gallows(self.board.incorrect_guesses.length)
        puts "GAME OVER DUMMY!"
        puts "The word was #{self.word}!"
        game_over = true
      elsif self.board.word_guessed?
        puts <<~heredoc
        ~~~~~~~~~~~~~~~~~~~~~~~~~
        CONGRATULATIONS, YOU WIN!
        ~~~~~~~~~~~~~~~~~~~~~~~~~

        "You correctly guessed that the word was: #{self.board.word}!"

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
