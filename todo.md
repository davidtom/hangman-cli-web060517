**-MAKE README FILE!!!**
**-MAKE README FILE!!!**
**-MAKE README FILE!!!**
**-MAKE README FILE!!!**

- In order to be able to reload games, we will need to utilize the following
code structure when dealing with instances of classes:
      def board
        @board ||= Board.new(self)
      end


- Create main_controller object with the following specifications
  - When a new game is started:
    - Asks how many players (1 or 2)
    - Asks who the user(s) are
      - reloads existing users
      - creates a new user for new players
    - allows users to play anonymously??
- Add ability to quit a game

**Cosmetic Improvements**
- Update game over/win window: clear terminal window, but reprint
  the word length, and letters guessed
