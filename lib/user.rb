class User

  attr_accessor :name, :game_array, :games, :record

  @@all = []

  def initialize(name)
    @name = name
    @games = []
    @record = {wins: 0, losses: 0}
    self.class.all << self
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
    if self.users.length == 0
      puts "<There are no saved users>"
    else
      self.users.each_with_index do |name, idx|
      puts "  #{idx + 1}. #{name}"
      end
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
    #sort in descending order by losses
    desc_losses = self.user_records.sort_by do |user, wins_losses|
      wins_losses[:losses] * -1
    end
    sorted_records = desc_losses.sort_by do |user, wins_losses|
      wins_losses[:wins]
    end
    sorted_records
  end

  def self.print_scoreboard
    puts "\nScoreboard:"
    puts "-----------------------------------"
    if self.users.length == 0
      puts "<There are no user records>"
    else
      place = 1
      printf "    %-20s %s %s\n", "User", "Wins", "Losses"
      self.sort_user_records.each do |user, wins_losses|
        printf "#{place}. %-20s  %s     %s\n", user, wins_losses[:wins], wins_losses[:losses]
        place += 1
      end
    end
    puts "\n<enter to return to main screen>"
    gets
  end

end
