class User

  attr_accessor :name, :game_array, :games, :record

  @@all = []

  def initialize(name)
    @name = name
    @games = []
    @record = {wins: 0, losses: 0}
    self.class.all << self
    # ###TESTING
    # @fga = ["pending", "pending", "pending", "loss", "loss", "loss", "win", "win", "win"]
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.select{|user| user.name == name}
  end

  def self.users
    self.all.collect{|user| user.name}
  end

  def self.print_users
    #self.users returns name strings only
    puts "Current Users:"
    puts "\n"
    self.users.each_with_index do |name, idx|
      puts "  #{idx + 1}. #{name}"
    end
    puts "\n<enter to return to main screen>"
    gets
  end

  def update_record(outcome)
    if outcome == "win"
      self.record[:wins] += 1
    elsif outcome == "loss"
      self.record[:losses] +=1
    else
      puts "something went wrong with updating user record"
      binding.pry
    end
  end

  def self.user_records
    self.all.each_with_object({}) do |user, scoreboard|
      scoreboard[user.name] = user.record
    end
  end

  def self.sort_user_records

  end

  def self.print_scoreboard
    puts self.user_records #TODO update this
    gets
  end

  # def self.get_user_records
  #   user_records = {
  #     win: 0,
  #     loss: 0
  #   }
  #   #
  #   self.all.collect do |user|
  #     user.
  #   end
  #
  #  @fga.each_with_object(users_record) do |result, record|
  #   case result
  #    when "win"
  #      record[:win] += 1
  #    when "pending"
  #      record[:pending] += 1
  #    when "loss"
  #       record[:loss] += 1
  #    else
  #      puts "something went wrong"
  #    end
  #  end
  # end










  # def self.find_or_create_by_name(name)
  #   name_match = self.all.select do |object|
  #     object.name == name
  #   end
  #   if name_match.length > 0
  #     puts "already used that bruh"
  #   else
  #     User.new(name)
  #   end
  # end

  # NOTE: rethought this: users don't create games, game controller does
  # def new_game
  #   @game_array << GameController.new(1)
  # end

  # def record
  #   users_record = {
  #     win: 0,
  #     loss: 0,
  #     pending: 0
  #   }
  #
  #  @fga.each_with_object(users_record) do |result, record|
  #   case result
  #    when "win"
  #      record[:win] += 1
  #    when "pending"
  #      record[:pending] += 1
  #    when "loss"
  #       record[:loss] += 1
  #    else
  #      puts "something went wrong"
  #    end
  #  end
  # end

end
