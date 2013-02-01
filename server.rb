require 'sinatra'

get "/puppies" do
  erb :puppies 
end

get "/puppy" do
  erb :puppy
end

get "/resources/stylesheet.css" do
  File.read(File.join('resources','stylesheet.css'))
end
