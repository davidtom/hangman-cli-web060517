class ResultScreen

  def initialize()
    #none
  end

  def self.print_loss_screen(incorrect_guesses, word)
    Gallows.print_gallows(incorrect_guesses)
    puts "GAME OVER!"
    puts "The word was #{word}!"
  end

  def self.print_win_screen(word)
    puts <<~heredoc
    ~~~~~~~~~~~~~~~~~~~~~~~~~
    CONGRATULATIONS, YOU WIN!
    ~~~~~~~~~~~~~~~~~~~~~~~~~

    "You correctly guessed that the word was: #{word}!"

    ------------------------------

    heredoc
  end

end
