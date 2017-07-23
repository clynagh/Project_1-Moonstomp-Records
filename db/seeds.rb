require_relative('../models/artist.rb')
require_relative('../models/album.rb')
require('pry')

@artist1 = Artist.new({
  'artist_name' => 'Streetlight Manifesto'
  })

@artist2 = Artist.new({
  'artist_name' => 'The Specials'
  })

@artist3 = Artist.new({
  'artist_name' => 'Madness'
  })

@artist1.save
@artist2.save
@artist3.save

@album1 = Album.new({
  'album_name' => 'Everything Goes Numb',
  'genre' => 'Ska',
  'current_stock' => 2,
  'ideal_stock' => 3
  })

@album2 = Album.new({
  'album_name' => 'In The Studio',
  'genre' => 'Ska',
  'current_stock' => 2,
  'ideal_stock' => 3
  })

@album3 = Album.new({
  'album_name' => 'One Step Beyond',
  'genre' => 'Ska',
  'current_stock' => 2,
  'ideal_stock' => 3
  })

@album1.save
@album2.save
@album3.save



binding.pry
nil

