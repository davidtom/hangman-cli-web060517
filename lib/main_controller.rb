class MainController

  attr_accessor :run_game

  def initialize
    @run_game = true
  end

  def print_menu_options
    puts "Please select from the following options"
  end

  def menu_options
    {
      n: ["New Game", self.new_game],
      s: ["Settings", self.enter_game_settings],
      l: ["List Commands", self.menu_options],
      c: ["Credits", self.print_credits],
      q: ["Quit", self.quit_game]
    }
  end

  def get_command
    STDIN.gets.chomp.downcase
  end

  def run_command(command)
    while !menu_options.keys.include?(command)
      puts "Invalid command"
      self.print_menu_options
    end
    menu_options[command][1]
  end

  def new_game

  end

  def quit_game
    puts "Thank you for playing Hangman"
    self.run_game = false
  end

end
