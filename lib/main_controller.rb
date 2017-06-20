class MainController

  attr_accessor :run_game

  def initialize
    @run_game = true
    self.run
  end

  def get_command
    STDIN.gets.chomp.downcase
  end

  def validate_command(command)
    if !MainScreen.menu_options.keys.include?(command.to_sym)
      puts "Invalid command"
      MainScreen.print_menu_options
      command = self.get_command
      validate_command(command)
    else
     command
   end
  end

  def run_command(command)
    case command
    when "n"
      self.new_game
    when "s"
      puts "print_scoreboard from User class" #User.print_scoreboard
    when "u"
      puts "print users from User class" #User.print_users
    # when "o"
    #   puts "enter options" #Options.menu?, #NOTE ??
    when "c"
      MainScreen.print_credits
    when "q"
      self.quit_game
    else
      puts "someone messed up!"
    end
  end

  def new_game
    GameController.new(1)
    #user = User.find_or_create_by_name
    #user.new_game(GameController.new(user)) #NOTE Reconfigure GameController.new() to count number of users passed in; this currently only allows one player at the moment, but should be exandable relatively easily through if/else
  end

  def quit_game
    MainScreen.exit_screen
    self.run_game = false
  end

  def run
    while self.run_game
      MainScreen.print_title_screen
      MainScreen.print_menu_options
      command = get_command
      run_command(validate_command(command))
    end
  end

end
