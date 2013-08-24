require 'spec_helper'
Dir["./spec/support/**/*.rb"].sort.each {|f| require f}
require 'quick_union_u_f'

describe QuickUnionUF do
  it_behaves_like "a union-find"
end
