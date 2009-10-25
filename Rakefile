# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

desc "Runs feature definition tests and specification tests"
task :default => [Rake::Task['db:migrate'], :cucumber] #adding cucumber to the default task

desc "Starts the server and does necessary stuff"
task :start => [Rake::Task['db:migrate'], :touch_logs] do
  sh "script/server"
end

desc "Touches the needed log files for server startup"
task :touch_logs do
   sh "touch log/cucumber.log"
   sh "touch log/development.log"
   sh "touch log/test.log"
end
