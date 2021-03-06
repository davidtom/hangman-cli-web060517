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
      # User.print_scoreboard
      User.print_scoreboard
    when "u"
      User.print_users
    when "c"
      MainScreen.print_credits
    when "q"
      self.quit_game
    else
      puts "someone messed up!"
    end
  end

  def new_game
    # GameController.new(1)
    puts "Please enter user name:"
    name = gets.chomp
    user = User.find_by_name(name)
    if user.any?
      puts "Starting new game as existing user: #{user[0].name}"
      puts "Press <enter> to continue to game"
      gets
      GameController.new(user[0])
    else
      puts "Starting new game as new user: #{name}"
      puts "Press <enter> to continue to game"
      gets
      GameController.new(User.new(name))
    end
    ### user
    ###user = User.find_or_create_by_name
    ###user.new_game(GameController.new(user)) #NOTE Reconfigure GameController.new() to count number of users passed in; this currently only allows one player at the moment, but should be exandable relatively easily through if/else
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
