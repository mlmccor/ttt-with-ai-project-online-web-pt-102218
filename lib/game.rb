require 'pry'
class Game
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new )
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      position_1 = self.board.cells[combination[0]]
      position_2 = self.board.cells[combination[1]]
      position_3 = self.board.cells[combination[2]]
      if  (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return combination
      end
    end
    false
  end
  
  def draw?
    if self.won? == false
      true
    end
  end
  
  def over?
    binding.pry
    self.won? == true || (self.draw? == true && self.board.turn_count == 10) ? true : false
  end
    
  

end
