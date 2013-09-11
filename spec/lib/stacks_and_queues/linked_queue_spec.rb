require 'spec_helper'
require 'stacks_and_queues/linked_queue'

describe LinkedQueue do
  subject do
    described_class.new
  end
  let(:queue) do
    subject
  end

  it 'implements LIFO' do
    result = []
    queue.enqueue 'to'
    queue.enqueue 'be'
    queue.enqueue 'or'
    queue.enqueue 'not'
    queue.enqueue 'to'
    result << queue.dequeue
    queue.enqueue 'be'
    result << queue.dequeue
    result << queue.dequeue
    queue.enqueue 'that'
    result << queue.dequeue
    result << queue.dequeue
    result << queue.dequeue
    queue.enqueue 'is'

    result.should == %w(to be or not to be)
  end

end
