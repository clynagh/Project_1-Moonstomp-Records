require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album')
require_relative('../models/artist')
require('pry-byebug')
also_reload( '../models/*.rb') if development?


get '/albums' do
  @albums = Album.all
  @artists = Artist.all
  erb(:"albums/index")
end

get '/albums/new' do
  @artists = Artist.all
  @albums = Album.all
  erb(:"albums/new")
end

#CREATE
post '/albums' do 
  Album.new(params).save
  redirect to '/albums'
end

#SHOW
get '/albums/:id' do
  @album = Album.find(params[:id])  
  erb(:"albums/show")
end

#EDIT
get '/albums/:id/edit' do
  @album = Album.find(params[:id])
  @artists = Artist.all
  erb(:"albums/edit")
end

# UPDATE
post '/albums/:id' do
  Album.new(params).update
  redirect to '/albums'
end

# #DESTROY
post '/albums/:id/delete' do
  @album = Album.find(params[:id] )
  @album.delete
  erb(:"albums/show")
  redirect to '/albums'
end

