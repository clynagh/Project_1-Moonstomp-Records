require('pry')
require_relative("../db/sql_runner")

class Album
  attr_reader :artist, :album_name, :album_pic

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @album_name = params['album_name']
    @genre = params['genre']
    @current_stock = params['current_stock']
    @ideal_stock = params['ideal_stock']
    @values = ['artist', 'album_name', 'genre', 'current_stock', 'ideal_stock']
  end 

  def save
    sql = "INSERT INTO albums (
    album_name, genre, current_stock, ideal_stock)
    VALUES
    ($1, $2, $3, $4)
    RETURNING id"
    values = [@album_name, @genre, @current_stock, @ideal_stock]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def find_album
    sql = "SELECT * from albums WHERE id = #{@album_name}"
    return SqlRunner.run(sql)[0]
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id};"
    return Album.new(SqlRunner.run(sql)[0])
  end
  
end