require_relative('./sql_runner')

class Album
  attr_reader :id, :title, :genre, :artist_id
  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums 
    (title,genre,artist_id) 
    VALUES 
    (
    '#{@title}',
    '#{@genre}',
    '#{@artist_id}') 
    RETURNING *;
    "
    savedalbums = SqlRunner.run(sql)
    album_object = savedalbums.map {|album| Album.new(album)}
    id_string = album_object[0].id
    @id = id_string.to_i
  end

  def self.list_all
    sql = "SELECT * FROM albums;"
    list_hash = SqlRunner.run(sql)
   list_object = list_hash.map { |album| Album.new(album)}
   return list_object
  end

  def list_by_album_id
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    by_album_hash = SqlRunner.run(sql)
    by_album_object = by_album_hash.map {|artist| Artist.new(artist)}
    return by_album_object
  end

  def update
    sql = "UPDATE albums SET (title,genre,artist_id) = (
    '#{@title}',
    '#{@genre}',
    '#{@artist_id}') WHERE id = #{@id};
    "


end