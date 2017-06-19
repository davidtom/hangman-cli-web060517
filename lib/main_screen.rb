#The MainScreen class is in charge of storing and printing items for the main screen. No instances should be made of it - all methods are class methods.
class MainScreen
  attr_reader :menu_options

  def initialize
    #none
  end

  def self.menu_options
    {
      n: "New Game",
      s: "Scoreboad",
      u: "Users",
      # o: "Options",
      c: "Credits",
      q: "Quit"
    }
  end

  def self.hangman_image
    <<~heredoc

      888
      888
      888
      88888b.  8888b. 88888b.  .d88b. 88888b.d88b.  8888b. 88888b.
      888 "88b    "88b888 "88bd88P"88b888 "888 "88b    "88b888 "88b
      888  888.d888888888  888888  888888  888  888.d888888888  888
      888  888888  888888  888Y88b 888888  888  888888  888888  888
      888  888"Y888888888  888 "Y88888888  888  888"Y888888888  888
                                   888
                              Y8b d88P
                               "Y88P"


    heredoc
  end

  def self.print_title_screen
    system "clear"
    puts self.hangman_image
    puts "Welcome to Hangman!"
  end

  def self.print_menu_options
    puts "Please select from the following options:"
    self.menu_options.each do |command, description|
      puts "  #{command} - #{description}"
    end
  end

  def self.print_credits
    system "clear"
    puts self.hangman_image
    puts <<~heredoc
    Built by Racquel Giner and David Tomczyk
    Flatiron School 060517 \'Hash Me Ousside\'


    heredoc
    puts "Press <enter> to return to menu"
    gets
  end

  def self.exit_screen
    system "clear"
    puts self.hangman_image
    puts "Thank you for playing Hangman!"
    gets
  end

end
