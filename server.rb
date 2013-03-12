require 'sinatra'
require 'yaml'

DATABASE = './database.yml'

get "/puppies" do
  erb :puppies 
end

get "/puppy/add" do
  erb :puppy_add_form
end

get "/puppy/:name" do
  @id = params[:name]
  erb :puppy
end

post "/puppy/add" do
  id = params[:id]
  name = params[:name]
  picture_id = params[:picture_id]
  bio = params[:bio]
  
  puppies[id] = {:id => id, :name => name, :picture_id => picture_id, :bio => bio }

  file_handle = File.open(DATABASE, 'w')
  file_handle.write puppies.to_yaml 
  file_handle.close
end

def puppies
  @puppies ||= YAML.load File.read(DATABASE)
end
