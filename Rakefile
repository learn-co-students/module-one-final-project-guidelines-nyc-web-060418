require_relative './config/environment'
require 'sinatra/activerecord/rake'
require 'rake'

desc "Start our app console"
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end
