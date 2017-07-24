require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/album')
require_relative('./models/artist')
require('pry-byebug')
also_reload( './models/*.rb') if development?

get '/moonstomp/artists' do
  @artist_name = Artist.all
  erb(:artists)
end

get '/moonstomp/new-artist' do
  @all_artists = Artist.all
  erb(:create_artist)
end

post '/moonstomp/new-artist' do 
  Artist.new(params).save
  redirect to '/moonstomp/artists'
end

get '/moonstomp/albums' do
  @albums = Album.all
  erb(:albums)
end

get '/moonstomp/new-album' do
  @artists = Artist.all
# binding.pry
  @albums = Album.all
  erb(:create_album)
end

post '/moonstomp/new-album' do 
  Album.new(params).save
  redirect to '/moonstomp/albums'
end