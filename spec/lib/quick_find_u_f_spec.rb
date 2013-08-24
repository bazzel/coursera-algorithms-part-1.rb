require 'spec_helper'
Dir["./spec/support/**/*.rb"].sort.each {|f| require f}
require 'quick_find_u_f'

describe QuickFindUF do
  it_behaves_like "a union-find"
end
