module SortHelpers
  private
  def less?(v, w)
    self[v] < self[w]
  end

  def exch(i, j)
    self[i], self[j] = self[j], self[i]
  end
end

