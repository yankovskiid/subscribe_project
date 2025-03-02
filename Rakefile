require 'rake'
require 'rspec/core/rake_task'

# Define a task to run RSpec tests
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

# Define a task to run all tasks
desc "Run RSpec tests"
task :default => :spec

# You can add more tasks here as needed, such as documentation generation or cleaning tasks.