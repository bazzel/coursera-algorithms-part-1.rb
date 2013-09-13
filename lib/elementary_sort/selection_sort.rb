# Algorithm. ↑ scans from left to right.
# Invariants:
#  ・Entries the left of ↑ (including ↑) fixed and in ascending order.
#  ・No entry to right of ↑ is smaller than any entry to the left of ↑.
module SelectionSort
  def sort
    0.upto(self.size-1) do |i|
      min = i
      (i+1).upto(self.size-1) do |j|
        if self[j] < self[min]
          min = j
        end

      end
      swap = self[i]
      self[i] = self[min]
      self[min] = swap
    end

    self
  end
end
