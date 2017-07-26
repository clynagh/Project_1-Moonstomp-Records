require_relative('../models/artist.rb')
require_relative('../models/album.rb')
require('pry')

@artist1 = Artist.new({
  'artist_name' => 'Nirvana'
  })

@artist2 = Artist.new({
  'artist_name' => 'The Specials'
  })

@artist3 = Artist.new({
  'artist_name' => 'Radiohead'
  })

@artist1.save
@artist2.save
@artist3.save

@album1 = Album.new({
  'album_name' => 'Nevermind',
  'genre' => 'Grunge',
  'current_stock' => 2,
  'ideal_stock' => 3,
  'artist_id' => @artist1.id
  })

@album2 = Album.new({
  'album_name' => 'In The Studio',
  'genre' => 'Ska',
  'current_stock' => 2,
  'ideal_stock' => 3,
  'artist_id' => @artist2.id
  })

@album3 = Album.new({
  'album_name' => 'Radiohead',
  'genre' => 'Alternative',
  'current_stock' => 2,
  'ideal_stock' => 3,
  'artist_id' => @artist3.id
  })

@album1.save
@album2.save
@album3.save



binding.pry
nil

