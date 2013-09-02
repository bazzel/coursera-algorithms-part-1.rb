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

  def initialize(n, uf_clazz)
    @n = n
    @uf = uf_clazz.new(sites_count)

    init_sites
  end

  def open?(r, c)
    assert_params(r, c)
    sites[idx_for(r, c)]
  end

  def open(r, c)
    assert_params(r, c)
    sites[idx_for(r, c)] = true

    connect_to_virtual_top_site(r,c)
    connect_to_upstairs_neighbor(r,c)
    connect_to_downstairs_neighbor(r,c)
    connect_to_left_neighbor(r,c)
    connect_to_right_neighbor(r,c)
    connect_to_virtual_bottom_site(r,c)
  end

  def full?(r, c)
    uf.connected?(0, idx_for(r,c))
  end

  def percolates?
    uf.connected?(0, sites_count-1)
  end

  private
  def connect_to_virtual_top_site(r,c)
    return unless first_row?(r)

    uf.union(0, idx_for(r,c))
  end

  def connect_to_virtual_bottom_site(r,c)
    return unless last_row?(r)

    uf.union(sites_count-1, idx_for(r,c))
  end

  def connect_to_upstairs_neighbor(r,c)
    return if first_row?(r)
    return unless open?(r-1,c)

    uf.union(idx_for(r,c), idx_for(r-1,c))
  end

  def connect_to_downstairs_neighbor(r,c)
    return if last_row?(r)
    return unless open?(r+1, c)

    uf.union(idx_for(r,c), idx_for(r+1,c))
  end

  def connect_to_left_neighbor(r,c)
    return if first_col?(c)
    return unless open?(r, c-1)

    uf.union(idx_for(r,c), idx_for(r,c-1))
  end

  def connect_to_right_neighbor(r,c)
    return if last_col?(c)
    return unless open?(r, c+1)

    uf.union(idx_for(r,c), idx_for(r,c+1))
  end

  def first_row?(r)
    r == 1
  end

  def last_row?(r)
    r == n
  end

  def first_col?(c)
    c == 1
  end

  def last_col?(c)
    c == n
  end

  def assert_params(r, c)
    raise IndexError.new unless r.between?(1,n) && c.between?(1,n)
  end

  def idx_for(r, c)
    (r-1)*n + c
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
