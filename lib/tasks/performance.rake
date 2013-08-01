require './store_config'
require 'benchmark'
require 'bundler'
Bundler.setup

def setup_database
  puts "Copying the development database to the test database"
  `cp db/monster_demo db/monster_test`
end

def submit_runtime(time)
  response = Faraday.post 'http://jumpstartlab-attendance.herokuapp.com/runtimes',
                          { :email_address => StoreConfig.email_address,
                            :runtime => time }
  if response.success?
    puts "Runtime of #{time} submitted for #{StoreConfig.email_address}"
  else
    puts "Failed to submit #{time} for #{StoreConfig.email_address}"
    puts response.body
  end
end

def run_performance_tests
  require 'rspec'
  require 'faraday'

  puts "Running the performance suite against #{ ENV['PERFORMANCE_ROOT'] }"
  result = 1
  time = Benchmark.measure do
    RSpec::Core::Runner.disable_autorun!
    result = RSpec::Core::Runner.run(['spec', '--tag', 'performance'])
  end
  if result == 0
    real_time = time.to_s.scan(/\((.*)\)/).first.first.to_f
    puts ""
    puts "Suite executed in #{real_time} seconds"
    return real_time
  else
    raise "One or more performance tests failed."
  end
end

namespace :performance do
  desc "Run the performance suite locally"
  task :local => :environment do
    setup_database
    ENV['PERFORMANCE_ROOT'] = StoreConfig.development_url
    run_performance_tests
  end

  desc "Run the performance suite against production"
  task :production => :environment do
    ENV['PERFORMANCE_ROOT'] = StoreConfig.production_url
    submit_runtime run_performance_tests
  end
end
