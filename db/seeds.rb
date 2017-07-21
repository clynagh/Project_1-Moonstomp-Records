require_relative('/models/artists')
require_relative('../models/albums')
require('pry')

Artists.delete_all
Albums.delete_all

@album1 = Album.new({
  'album_name' => 'Everything Goes Numb',
  'artist' => 'Streetlight Manifesto',
  'album_pic' => 'www'
  })

@album2 = Album.new({
  'album_name' => 'In The Studio',
  'artist' => 'The Specials',
  'album_pic' => 'www'
  })

@album3 = Album.new({
  'album_name' => 'One Step Beyond',
  'artist' => 'Madness',
  'album_pic' => 'www'
  })




@album1.save
@album2.save
@album3.save





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


binding.pry
nil









# CREATE TABLE albums(
# id SERIAL4 PRIMARY KEY,
# artist_id INT4 REFERENCES artists (id),
# album_name VARCHAR(255),
# genre VARCHAR(255),
# buy_pr DECIMAL(5,2),
# sell_pr DECIMAL(5,2),
# album_pic VARCHAR(255)
# current_stock INT4,
# ideal_stock INT4
# );

