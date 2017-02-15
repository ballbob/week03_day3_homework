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

end