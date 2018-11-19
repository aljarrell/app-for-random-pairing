require 'sinatra'
require_relative 'random_pairing.rb'

get '/' do
  erb :input_page
end

post '/input_page' do
  names = params[:names]
  puts names
  redirect 'results?input_page=' + input_page
end

get '/results' do
  names = params[:names]
  puts names 
  erb :results, locals: {names: names}
end
