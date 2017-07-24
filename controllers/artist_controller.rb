require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album')
require_relative('../models/artist')
require('pry-byebug')
also_reload( '../models/*.rb') if development?

get '/artists' do
  @artist_name = Artist.all
  erb(:"artists/index")
end

get '/artists/new' do
  @all_artists = Artist.all
  erb(:"artists/new")
end

post '/artists' do 
  Artist.new(params).save
  redirect to '/artists'
end
