class Percolation

  attr_reader :n, :sites

  def initialize(n)
    @n = n
    QuickUnionUF.new(n+2)

    # Create an array with all sites for tracking if they're open (true) or closed (false)
    @sites = Array.new(n**2+2, false)
  end

  def open?(r, c)
    assert_params(r, c)

    sites[idx_for(r, c)]
  end

  def open(r, c)
    sites[idx_for(r, c)] = true
  end

  private
  def assert_params(r, c)
    raise IndexError.new unless r.between?(1,n) && c.between?(1,n)
  end

  def idx_for(r, c)
    (r-1)*5*c + c
  end
end
