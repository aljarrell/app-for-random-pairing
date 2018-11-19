require 'sinatra'
require_relative 'random_pairing.rb'

get '/' do
  erb :input_page
end

post '/input_page' do
  studentlist = params[:studentlist]
  redirect 'results?studentlist=' + studentlist
end

get '/results' do
  studentlist = params[:studentlist].split(", ")
  pair = random_pair(studentlist)
  erb :results, locals: {studentlist: studentlist, pair: pair}
end
