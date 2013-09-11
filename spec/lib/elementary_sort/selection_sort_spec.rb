require 'spec_helper'
require 'elementary_sort/selection_sort'

describe SelectionSort do
  subject            { described_class.sort items }
  let(:items)        { %w(foo bar baz qux quux corge grault garply waldo fred plugh xyzzy thud) }
  let(:sorted_items) { %w(bar baz corge foo fred grault garply plugh quux qux thud waldo xyzzy) }

  it 'sorts the input' do
    subject
    items.should == sorted_items
  end
end
