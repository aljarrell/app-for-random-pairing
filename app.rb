require 'sinatra'
require_relative 'random_pairing.rb'

get '/' do
  erb :input_page
end

post '/input_page' do
  studentlist = params[:studentlist]
  redirect 'confirm?studentlist=' + studentlist
end

get '/confirm' do
  choice = params[:choice]
  studentlist = params[:studentlist]
  pair = random_pair(studentlist.split(", "))
  p "this is studentlist #{studentlist}"
  if choice == "no"
    pair = random_pair(studentlist.split(", "))
  end
  p "this is pair #{pair}"
  erb :confirm, locals: {studentlist: studentlist, pair: pair, choice: choice}
end

post '/confirm' do
  choice = params[:choice]
  studentlist = params[:studentlist]
  redirect 'results?studentlist=' + studentlist + '&choice=' + choice
end

get '/results' do
  choice = params[:choice]
  studentlist = params[:studentlist]
  pair = random_pair(studentlist.split(", "))
  erb :results, locals: {studentlist: studentlist, pair: pair, choice: choice}
end
