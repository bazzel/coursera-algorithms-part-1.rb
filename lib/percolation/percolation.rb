class Percolation

  attr_reader :n

  def initialize(n)
    @n = n
    QuickUnionUF.new(n+1)
  end

  def open?(i, j)
    assert_params(i, j)
  end

  def assert_params(i, j)
    raise IndexError.new unless i.between?(1,n) && j.between?(1,n)
  end
end
