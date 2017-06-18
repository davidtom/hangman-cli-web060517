class GameController

  attr_accessor :name, :status, :correct_guesses, :incorrect_guesses
  attr_reader :word

  def initialize(num_players)
    @correct_guesses = []
    @incorrect_guesses = []
    @status = []
    case num_players
    when 1
      @word = Word.new.word
    when 2
      ## TODO GET WORD FROM SECOND PLAYER
    when 3
      ## TODO HEAD TO HEAD MODE
    else
     puts "someone screwed up"
   end
   self.update_status
  end

  def word_array
    self.word.split("")
  end

  def get_guess
    STDIN.gets.chomp.downcase
  end

  def check_guess
    guess = self.get_guess
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

end
