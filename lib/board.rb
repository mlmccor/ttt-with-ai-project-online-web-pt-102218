class Board
  attr_accessor :cells
  def initialize
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(position)
    self.cells[position.to_i-1]
  end

  def reset!
    self.cells.clear
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def full?
    self.cells.include?(" ") ? false : true
  end

  def turn_count
    taken = self.cells.select {|space| space == ("X" || "O")}
    taken.length + 1
  end

  def taken?(space)
    if self.cells[space.to_i - 1] == "X" || self.cells[space.to_i - 1] == "O"
      true
    else
      false
    end
  end

  def valid_move?(space)
    if space.to_i <= 0
      return false
    end
    self.taken?(space.to_i) == false ? true : false
  end

  def update(space, player)
    self.cells[space.to_i - 1] = player.token
  end

end
