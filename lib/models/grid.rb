class Grid
  attr_accessor :nodes

  def initialize(row_count = 10, column_count = 10)
    @nodes = setup_nodes(row_count, column_count)
  end

  def setup_nodes(row_count, column_count)
    row_count = row_count - 1
    column_count = column_count - 1
    nodes = []

    (0..row_count).each do |x|
      row = []

      (0..column_count).each do |y|
        node = Node.new(x, y, row_count, column_count)
        row << [node]
      end

      nodes << row
    end

    nodes
  end
end
