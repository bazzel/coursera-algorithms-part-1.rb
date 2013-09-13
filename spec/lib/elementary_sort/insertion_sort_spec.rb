require 'spec_helper'
require 'elementary_sort/insertion_sort'

describe InsertionSort do
  subject            { items.sort }
  let(:items)        { %w(foo bar baz qux quux corge grault garply waldo fred plugh xyzzy thud) }
  let(:sorted_items) { %w(bar baz corge foo fred garply grault plugh quux qux thud waldo xyzzy) }

  before { items.extend described_role }

  it { should == sorted_items }
end
