require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album')
require_relative('../models/artist')
require('pry-byebug')
also_reload( '../models/*.rb') if development?


get '/albums' do
  @albums = Album.all
  erb(:"albums/index")
end

get '/albums/new' do
  @artists = Artist.all
  @albums = Album.all
  erb(:"albums/new")
end

post '/albums' do 
  Album.new(params).save
  redirect to '/albums'
end
