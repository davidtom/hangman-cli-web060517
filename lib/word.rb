#<Description of class>
class Word
  attr_reader :word

  @@library = ["potato", "unicorn", "quixotic", "sweater", "humidity", "mountain", "goldfish", "aquatic", "plebian", "zebra"]

  def initialize()
    @word = self.class.library.sample
  end

  def self.library
    @@library
  end
end
