require 'sinatra'

get "/puppies" do
  erb :puppies 
end

get "/puppy" do
  erb :puppy
end
