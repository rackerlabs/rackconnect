require "bundler/gem_tasks"

task :c do
  exec "irb -r rackconnect -I ./lib"
end

namespace :mock do
  desc "Start Mock Server"
  task :server do
    system "ruby ./spec/support/mock_server.rb"
  end

  desc "Run the specs"
  task :spec do
    system "RACKCONNECT_MOCK=true rspec spec"
  end
end
