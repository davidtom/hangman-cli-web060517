class GameController
  attr_accessor :game_outcome
  attr_reader :word_object, :board

  def initialize(num_players)

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

  def clear_terminal
    system "clear"
  end

  def run_game
    # Print initial welcome messages to terminal
    self.clear_terminal

    # Set game status
    game_over = false
    self.game_outcome = "pending"

    # Create initial status
    self.board.update_status

    # Run through guessing loop
    while !game_over
      Gallows.print_gallows(self.board.incorrect_guesses.length)
      self.board.print_word_length
      self.board.print_status
      self.board.print_incorrect_guesses
      guess = Guess.get_guess
      self.board.check_guess(guess)
      self.board.update_status
      if self.board.guess_limit_reached?
        Gallows.print_gallows(self.board.incorrect_guesses.length)
        puts "GAME OVER!"
        puts "The word was #{self.board.word}!"
        self.game_outcome = "loss"
        game_over = true
      elsif self.board.word_guessed?
        puts <<~heredoc
        ~~~~~~~~~~~~~~~~~~~~~~~~~
        CONGRATULATIONS, YOU WIN!
        ~~~~~~~~~~~~~~~~~~~~~~~~~

        "You correctly guessed that the word was: #{self.board.word}!"

        ------------------------------

        heredoc
        self.game_outcome = "win"
        game_over = true
      else
        self.clear_terminal
      end
    end
  end
  #TODO: create method to ask user to start a new game or not? yes -> new game_controller instance; n -> return to main menu. Does this belong at bottom of run_game??
end
