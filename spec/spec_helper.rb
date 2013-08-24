RSpec.configure do |c|
  c.filter_run_excluding performance: true
  c.filter_run focused: true
  c.alias_example_to :fit, focused: true
  c.run_all_when_everything_filtered = true
end

