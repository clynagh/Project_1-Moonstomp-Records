require('pry')
require_relative("../db/sql_runner.rb")

class Artist
  attr_reader :artist_name

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @artist_name = params['artist_name']
  end 

  def artist_name()
    return @artist_name
  end

  def save
    sql = "INSERT INTO artists (
      artist_name)
    VALUES
    ($1)
    RETURNING id"
    values = [@artist_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    values = []
    artists = SqlRunner.run(sql, values)
    return artists.map{|artist| Artist.new(artist)}
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = #{id};"
    values = [id]
    return Artist.new(SqlRunner.run(sql, values)[0])
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    values = []
    SqlRunner.run( sql, values )
  end


end