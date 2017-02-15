require('pry')
require_relative('./artist.rb')
require_relative('./album.rb')

artist1 = Artist.new({'name' => 'R Kelly'})
artist1.save()

artist2 = Artist.new({'name' => 'Insane Clown Posse'})
artist2.save

 album1 = Album.new({'title' => 'Ignition', 'genre' => 'RnB', 'artist_id' => artist1.id})
 album1.save()


 album2 = Album.new({'title' => 'Trapped in the Closet', 'genre' => 'RnB', 'artist_id' => artist1.id})
 album2.save()

 album3 = Album.new({'title' => 'Riddle Box', 'genre' => 'R&B', 'artist_id' => artist2.id})
 album3.save


binding.pry


nil