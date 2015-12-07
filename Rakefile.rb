require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'

############# ALL ############# 
desc "Run all tests"
# RUN ALL
RSpec::Core::RakeTask.new('all') do |t|
  t.pattern = [
      'test_*.rb'
  ]
end