# Stack: linked-list representation
# Maintain pointer to first node in a linked list; insert/remove from front.
class LinkedStack
  Node = Struct.new(:item, :next)
  attr_reader :first

  def push(item)
    @first = Node.new(item, first)
  end

  def pop
    return if is_empty?

    item = first.item
    @first = first.next
    item
  end

  def is_empty?
    !first
  end
end
