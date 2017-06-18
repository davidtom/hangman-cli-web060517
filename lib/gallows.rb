class Gallows

  attr_reader :gallows

  @@gallows1 = {
    0 => <<~heredoc,
      ∏∏----------
      ||       |
      ||
      ||
      ||
      ||
      ||
      ||
    ------------------
    heredoc
    1 => <<~heredoc,
      ∏∏----------
      ||       |
      ||       O
      ||
      ||
      ||
      ||
      ||
    ------------------
    heredoc
    2 => <<~heredoc,
      ∏∏----------
      ||       |
      ||       O
      ||       |
      ||       |
      ||
      ||
      ||
    ------------------
    heredoc
    3 => <<~heredoc,
      ∏∏----------
      ||       |
      ||       O
      ||      \\|
      ||       |
      ||
      ||
      ||
    ------------------
    heredoc
    4 => <<~heredoc,
      ∏∏----------
      ||       |
      ||       O
      ||      \\|/
      ||       |
      ||
      ||
      ||
    ------------------
    heredoc
    5 => <<~heredoc,
      ∏∏----------
      ||       |
      ||       O
      ||      \\|/
      ||       |
      ||      /
      ||
      ||
    ------------------
    heredoc
    6 => <<~heredoc,
      ∏∏----------
      ||       |
      ||       O
      ||      \\|/
      ||       |
      ||      / \\
      ||
      ||
    ------------------
    heredoc
  }

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
