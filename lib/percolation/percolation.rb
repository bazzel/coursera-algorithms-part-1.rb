class Percolation

  attr_reader :n

  def initialize(n)
    @n = n
    QuickUnionUF.new(n+1)
  end

  def open?(r, c)
    assert_params(r, c)
  end

  def open(r, c)

  end

  private
  def assert_params(r, c)
    raise IndexError.new unless r.between?(1,n) && c.between?(1,n)
  end
end
