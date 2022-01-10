class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n*n
  end 

  def size
    @size
  end

  def [](indices)
    position = @grid[indices[0]][indices[1]]
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    count_ships = 0
    @grid.each do |position|
        position.each { |value| count_ships += 1 if value == :S }
    end
    count_ships
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      p 'you sunk my battleship!'
      true
    else 
      self[position] = :X
      false
    end
  end

  def place_random_ships
    total_ships = @size*0.25

    while self.num_ships < total_ships
      random_row = rand(0...@grid.length)
      random_col = rand(0...@grid.length)
      position = [random_row, random_col]
      self[position] = :S
    end 
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele| 
        if ele == :S
          :N
        else
          ele
        end
      end
    end
  end
  
  def self.print_grid(grid)
    grid.each do |row| 
      puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end