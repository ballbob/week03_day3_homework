require_relative('./sql_runner')

class Album

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

end