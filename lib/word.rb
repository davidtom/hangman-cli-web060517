#<Description of class>
class Word
  attr_reader :word

  @@library = ["potato", "unicorn", "quixotic", "sweater", "humidity", "mountain", "goldfish", "aquatic", "plebian", "zebra"]

  def initialize
    #Set word instance attribute to be a random word from library, and make it
    # all lowercase
    @word = self.class.library.sample.downcase
  end

  def self.library
    @@library
  end
end
