class Board
  attr_accessor :status, :correct_guesses, :incorrect_guesses
  attr_reader :game_controller, :word_object, :guess_limit

  def initialize(game_controller, word_object)
    @guess_limit = 6
    @correct_guesses = []
    @incorrect_guesses = []
    @status = []
    @game_controller = game_controller
    @word_object = word_object
  end

  def word
    self.word_object.word
  end

  def word_array
    self.word.split("")
  end

  def check_guess(guess)
    while !Guess.valid_letter?(guess)
      puts "That is not a letter!"
      guess = Guess.get_guess
    end
    while correct_guesses.include?(guess) || incorrect_guesses.include?(guess)
      puts "You've already guessed that letter!"
      guess = Guess.get_guess
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

  def print_word_length
    puts "Your word has #{self.word.length} letters."
  end

  def guess_limit_reached?
    self.incorrect_guesses.length == self.guess_limit ? true : false
  end

  def word_guessed?
    self.status.join.strip == self.word ? true : false
  end

end
