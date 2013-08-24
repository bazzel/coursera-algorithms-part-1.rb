class UnionFind

  def initialize(sites_count)
    @id = Array.new(sites_count) { |i| i }
  end

  def connected?(p, q)
    @id[p] == @id[q]
  end

  def union(p, q)
    p_id, q_id = @id[p], @id[q]

    @id.each_with_index do |item, index|
      @id[index] = q_id if item == p_id
    end
  end
end

