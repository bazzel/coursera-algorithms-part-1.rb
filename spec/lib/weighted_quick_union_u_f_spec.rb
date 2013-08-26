require 'spec_helper'
Dir["./spec/support/**/*.rb"].sort.each {|f| require f}
require 'weighted_quick_union_u_f'

describe WeightedQuickUnionUF do
  it_behaves_like "a union-find"
end
