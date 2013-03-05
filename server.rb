require 'sinatra'
require 'yaml'

get "/puppies" do
  erb :puppies 
end

get "/puppy/:name" do
  @id = params[:name]
  erb :puppy
end

def puppies
  @puppies ||= YAML.load File.read('./database.yml')
end
