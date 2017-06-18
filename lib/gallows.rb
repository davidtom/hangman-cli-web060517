class Gallows

  attr_reader :gallows

  @@gallows1 = {}

  def initialize(type)
    case type
    when 1
      @gallows = @@gallows1
    when 2
      @gallows = {} #TODO make another set of gallows frames
    else
      puts "someone messed up"
    end
  end
end
