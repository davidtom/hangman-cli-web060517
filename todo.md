- Create User Object with following specifications
  - Users initialize with a name
  - All users are stored by the User class
  - There should be a find_or_create_by_name method (if user with name exists, return that user; else create a new user with name name)
  - Users should store all games they have played
    - might need to make a game class (has W/L, and a game controller instance?)
  - Users should be able to know their record
  - User class should be able to display a scoreboard


- Create main_controller object with the following specifications
  - Welcomes a user to the game
  - Displays options to the user and asks them to select one. Options are:
    - New game
    - Scoreboard
    - Users
    - Settings
    - Credits
    - Quit
  - The following settings can be changed:
    - Gallows images
    - Difficulty (# guesses)
  - When a new game is started:
    - Asks how many players (1 or 2)
    - Asks who the user(s) are
      - reloads existing users
      - creates a new user for new players
    - Starts the game

- Split game controller out into at least one other class (game_logic); two may be better (guess and game_logic/check)
- Allow people to guess the word outright??? (this seems to be in a lot of peoples' games. I'm not sure I'm sold though
- Add larger library of words (find a gem)



**Cosmetic Improvements**
- Update game over/win window: clear terminal window, but reprint
  the word length, and letters guessed
