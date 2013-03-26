desc "Start the server"
task :server do
  require "./server"
  Sinatra::Application.run!
end

namespace :db do
  desc "setup database"
  task :seed do
    system "copy database.seed.yml database.yml"
  end
end