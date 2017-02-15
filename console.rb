require('pry')
require_relative('./artist.rb')
require_relative('./album.rb')

artist1 = Artist.new({'name' => 'R Kelly'})
artist1.save()


album1 = Album.new({'title' => 'Ignition', 'genre' => 'RnB', 'artist_id' => artist1.id})
album1.save()


album2 = Album.new({'title' => 'Trapped in the Closet', 'genre' => 'RnB', 'artist_id' => artist1.id})
album2.save()






binding.pry


nil