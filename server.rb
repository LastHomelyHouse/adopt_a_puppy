require 'sinatra'

get "/puppies" do
  erb :puppies 
end

get "/puppy/:name/:picture_id" do
  @name = params[:name]
  @picture_id = params[:picture_id]
  erb :puppy
end
