# Queue: linked-list representation
# Maintain pointer to first and last nodes in a linked list;
# insert/remove from opposite ends.
class LinkedQueueOfStrings
  Node = Struct.new(:item, :next)
  attr_reader :first, :last

  def enqueue(item)
    oldlast = last
    @last = Node.new(item, nil)

    if is_empty?
      @first = last
    else
      oldlast.next = last
    end
  end

  def dequeue
    return if is_empty?

    item = first.item
    @first = first.next
    item
  end

  def is_empty?
    !first
  end
end
