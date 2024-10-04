class Node
  attr_accessor :neighbors
  attr_reader :x_coordinate, :y_coordinate

  def initialize(x_coordinate, y_coordinate, row_count, column_count, cell = nil)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @neighbors = establish_neighbors(row_count, column_count)
    @cell = nil
  end

  def establish_neighbors(row_count, column_count)
    directions = [[1, 0], [0, 1], [-1, 0], [0, -1], [1, 1], [-1, 1], [-1, -1], [1, -1]] # Up, Down, Left, Right, Upper Corner Right, Upper Corner Left, Lower Corner Left, Lower Corner Right
    results = []

    directions.each do |dir|
      neighbor = [@x_coordinate + dir[0], @y_coordinate + dir[1]]

      # Append to results if neighbor coordinates are within our grid dimensions
      results << neighbor if (0..row_count).include?(neighbor[0]) && (0..column_count).include?(neighbor[1])
    end

    results
  end
end