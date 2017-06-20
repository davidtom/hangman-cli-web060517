#<Description of class>
class Word
  attr_reader :word

  ## Initial Testing Word Library
  # @@library = ["potato", "unicorn", "quixotic", "sweater", "humidity", "mountain", "goldfish", "aquatic", "plebian", "zebra"]

  ## Production Word Library: 55,900 Words
  #Find current directory of file
  @@pwd = Dir.pwd
  #Append /lib/[file_name] to currenty directory and read file to array
  @@library = File.read(@@pwd + "/lib/words.txt").split(" ")

  def initialize
    #Set word instance attribute to be a random word from library, and make it
    # all lowercase
    @word = self.class.library.sample.downcase
  end

  def self.pwd
    @@pwd
  end

  def self.library
    @@library
  end

end
