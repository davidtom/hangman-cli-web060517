class GameController
  attr_accessor :game_outcome
  attr_reader :word_object, :board

  def initialize(num_players) #TODO I think initialize should take an instance of user. Therefore: we need a user attribute. Also need a method to update the users record after a game

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

  def new_game?
    puts "Would you like to start a new game?"
    puts "\t Enter <y> to start new game"
    puts "\t Enter <n> to return to main menu"
    ans = STDIN.gets.chomp.downcase.strip
    case ans
    when "y"
      GameController.new(1)
    when "n"
      #nothing! go back to MainController loop
    end
  end

  def run_game
    # Clear previous actions on terminal screen
    self.clear_terminal

    # Set game status
    game_over = false
    self.game_outcome = "pending"

    # Create initial status
    self.board.update_status

    # Run through guessing loop
    while !game_over
      MainScreen.print_hangman_image
      Gallows.print_gallows(self.board.num_incorrect_guesses)
      self.board.print_word_length
      self.board.print_status
      self.board.print_incorrect_guesses
      guess = Guess.get_guess
      self.board.check_guess(guess)
      self.board.update_status
      if self.board.guess_limit_reached?
        self.clear_terminal
        MainScreen.print_hangman_image
        ResultScreen.print_loss_screen(self.board.num_incorrect_guesses, self.board.word) #TODO NOTE refactor this ugly thing into a method
        self.game_outcome = "loss"
        game_over = true
      elsif self.board.word_guessed?
        ResultScreen.print_win_screen(self.board.word)
        self.game_outcome = "win"
        game_over = true
      else
        self.clear_terminal
      end
    end
    self.new_game? #TODO decide if this is an instance method or a class method
  end
  #TODO: create method to ask user to start a new game or not? yes -> new game_controller instance; n -> return to main menu. Does this belong at bottom of run_game??
end
