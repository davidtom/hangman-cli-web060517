task :default => :console

desc "Loads modules in ./config/environment.rb"
task :environment do
  require_relative "./config/environment.rb"
end

desc "Opens a pry console after loading environment.rb. This is the default task."
task :console => :environment do
  pry.Start
end

desc "Executes the run file in ./bin"
task :run do
  sh "ruby ./bin/run"
end
