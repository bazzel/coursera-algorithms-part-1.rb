require 'spec_helper'
require 'elementary_sort/selection_sort'

describe SelectionSort do
  subject            { items.sort }
  let(:items)        { %w(foo bar baz qux quux corge grault garply waldo fred plugh xyzzy thud) }
  let(:sorted_items) { %w(bar baz corge foo fred grault garply plugh quux qux thud waldo xyzzy) }

  before { items.extend described_role }

  it { should == sorted_items }
end
