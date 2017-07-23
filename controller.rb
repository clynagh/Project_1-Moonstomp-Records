require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/album')
require_relative('./models/artist')

get '/moonstomp/artists' do
  @artist_name = Artist.all
  erb(:artists)
end

get '/moonstomp/new-artist' do
  @all_artists = Artist.all
  erb(:create_artist)
end

post '/hogwarts/new-artist' do 
  Artist.new(params).save
  redirect to '/moonstomp/artists'
end