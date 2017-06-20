class User

  attr_accessor :name, :game_array, :fga

  @@all = []

  def initialize(name)
    @name = name
    ###TESTING
    @fga = ["pending", "pending", "pending", "loss", "loss", "loss", "win", "win", "win"]
    @@all << self
  end

  def self.find_or_create_by_name(name)
    name_match = self.all.select do |object|
      object.name == name
    end
    if name_match.length > 0
      puts "already used that bruh"
    else
      User.new(name)
    end
  end

  def self.all
    @@all
  end



  def new_game
    @game_array << GameController.new(1)
  end

  def record
    users_record = {
      win: 0,
      loss: 0,
      pending: 0
    }

   @fga.each_with_object(users_record) do |result, record|
    case result
     when "win"
       record[:win] += 1
     when "pending"
       record[:pending] += 1
     when "loss"
        record[:loss] += 1
     else
       puts "something went wrong"
     end
   end
  end

end
