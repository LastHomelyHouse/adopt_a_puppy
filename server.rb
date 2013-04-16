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

get "/puppy/:name/edit" do\
  erb :puppy_edit_form, :locals => puppies[params[:name]]
end

post "/puppy/add" do
  id = params[:id]
  name = params[:name]
  picture_id = params[:picture_id].to_i
  bio = params[:bio]
  
  puppies[id] = {:id => id, :name => name, :picture_id => picture_id, :bio => bio }

  File.open(DATABASE, 'w') do |file_handle|
    file_handle.write puppies.to_yaml 
  end
  redirect "/puppy/#{id}"
end

def puppies
  @puppies ||= YAML.load File.read(DATABASE)
end

get "/puppy/:id/delete" do
  puppies.delete params[:id]
  puppies.to_yaml
end

get "/puppy/:id/ask_a_question" do
  erb :ask_a_question_form 
end

post "/puppy/:id/ask_a_question" do
  questions=[]
  questions << params
  File.open('questions.yml','w') do |file_handle|
    file_handle.write questions.to_yaml
  end
   erb :question_thank_you
end
