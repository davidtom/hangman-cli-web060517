class GameController
  attr_accessor :game_outcome
  attr_reader :word_object, :board, :user1

  def initialize(user1, user2 = nil)
    @user1 = user1
    #Check number of players and create word accordingly
    if !user2
      @word_object = Word.new
      self.user1.games << self
    elsif user2
      ##TODO: add 2 player functionality later
    else
      raise ArgumentError.new("Something is wrong users for a new game!")
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
      GameController.new(self.user1)
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
        ResultScreen.print_loss_screen(self.board.num_incorrect_guesses, self.board.word)
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
    user1.update_record(self.game_outcome)
    self.new_game?
  end
end
