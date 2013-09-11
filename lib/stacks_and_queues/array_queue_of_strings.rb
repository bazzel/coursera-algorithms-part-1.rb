# Array implementation of a queue
class ArrayQueueOfStrings < Array
  alias :enqueue :unshift
  alias :dequeue :pop
end
