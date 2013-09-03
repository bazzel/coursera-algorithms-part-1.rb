class PercolationRandomizer
  attr_reader :n, :positions

  # Create an array representing an n*n plane
  # with [x,y] coordinates as its elemens
  #
  # @example
  #   PercolationRandomizer.new(4)
  #   # => [[1,1], [1,2], [1,3], [1,4],
  #         [2,1], [2,2], [2,3], [2,4],
  #         [3,1], [3,2], [3,3], [3,4],
  #         [4,1], [4,2], [4,3], [4,4]]
  def initialize(n)
    @n = n
    init_positions
  end

  # @return [Array<FixNum, FixNum] a random element from the array
  def position
    positions.delete(positions.sample)
  end

  private
  def init_positions
    @positions = []
    1.upto(n) do |r|
      1.upto(n) do |c|
        positions << [r,c]
      end
    end
  end
end
