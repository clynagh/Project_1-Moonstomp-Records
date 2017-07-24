require('pry')
require_relative("../db/sql_runner.rb")

class Album
  attr_reader :album_name, :genre, :current_stock, :ideal_stock, :id, :artist_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @album_name = params['album_name']
    @genre = params['genre']
    @current_stock = params['current_stock']
    @ideal_stock = params['ideal_stock']
    @artist_id = params['artist_id'].to_i
  end 

  def save
    sql = "INSERT INTO albums (
    album_name, genre, current_stock, ideal_stock, artist_id)
    VALUES
    ($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@album_name, @genre, @current_stock, @ideal_stock, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def find_album
    sql = "SELECT * from albums WHERE id = #{@album_name}"
    return SqlRunner.run(sql)[0]
  end

  def self.all()
    sql = "SELECT * FROM albums"
    values = []
    albums = SqlRunner.run(sql, values)
    return albums.map{|album| Album.new(album)}
  end

  
end