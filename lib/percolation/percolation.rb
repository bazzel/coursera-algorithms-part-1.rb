#             +--+
#             | 0|
#             +--+  +--> r
#       +--+--+--+--+--+     ^
#       | 1| 2| 3| 4| 5|     |
#       +--+--+--+--+--+     |
#       | 6| 7| 8| 9|10|     |
#       +--+--+--+--+--+     |
#       |11|12|13|14|15|     |N
#       +--+--+--+--+--+     |
#       |16|17|18|19|20|     |
#     + +--+--+--+--+--+     |
#     | |21|22|23|24|25|     |
#     v +--+--+--+--+--+     v
#     c       +--+
#             |26|
#             +--+
#
#       <-------------->
#               N
class Percolation

  attr_reader :n, :sites, :uf

  def initialize(n)
    @n = n
    @uf = QuickUnionUF.new(sites_count)

    init_sites
  end

  def open?(r, c)
    assert_params(r, c)
    sites[idx_for(r, c)]
  end

  def open(r, c)
    assert_params(r, c)
    sites[idx_for(r, c)] = true
    uf.union(0, idx_for(r,c))
  end

  def full?(r, c)
    uf.connected?(0, idx_for(r,c))
  end

  private
  def assert_params(r, c)
    raise IndexError.new unless r.between?(1,n) && c.between?(1,n)
  end

  def idx_for(r, c)
    (r-1)*5*c + c
  end

  # Create an array with all sites for tracking if they're open (true) or closed (false)
  def init_sites
    @sites = Array.new(sites_count, false)
    sites[0] = true
    sites[sites_count-1] = true
  end

  def sites_count
    n**2+2
  end
end
