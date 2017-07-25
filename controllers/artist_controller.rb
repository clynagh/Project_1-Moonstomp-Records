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

#CREATE
post '/artists' do 
  Artist.new(params).save
  redirect to '/artists/#{artist.id}'
end

#SHOW
get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb(:"artists/show")
end

#EDIT
get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb(:edit)
end

# UPDATE
post '/artists/:id' do
  Artist.new(params).update
  redirect to '/artists'
end

# #DESTROY
post '/artists/:id/delete' do
  artist = Artist.find( params[:id] )
  artist.delete()
  redirect to '/artists'
end

post '/artists/:id/delete' do
  Artists.destroy(params[:id])
  redirect to("/artists")
end

