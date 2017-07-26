require('pry-byebug')
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

  def artist
      sql = "SELECT * FROM artists 
      WHERE id = $1"
      values = [@artist_id]
      results = SqlRunner.run(sql, values)
      return Artist.new( results.first )
  end

  def self.find(id)
    sql = "SELECT * FROM albums 
    WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Album.new( results.first )
  end

  def self.all()
    sql = "SELECT * FROM albums"
    values = []
    albums = SqlRunner.run(sql, values)
    return albums.map{|album| Album.new(album)}
  end

  def percentage()
    result = (@current_stock.to_f/@ideal_stock.to_f) * 100
    percentage = result.to_i
      case 
       when percentage > 100
       'Overstocked'
       when percentage > 60
       'HIGH'
       when percentage > 40
       'MEDIUM'
       when percentage < 40
       'LOW'
       else        
       'ORDER MORE'
      end
  end

  def update()
    sql = "UPDATE albums SET (
    album_name, genre, current_stock, ideal_stock, artist_id)
    =
    ($1, $2, $3, $4, $5)
    WHERE id = #{@id};"
    values = [@album_name, @genre, @current_stock, @ideal_stock, @artist_id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end




   