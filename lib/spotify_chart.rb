require 'json'
require 'open-uri'
require 'pry'

class SpotifyChart

  attr_reader :base_url

  def initialize
    #chain pref and region 
    @base_url = "http://charts.spotify.com/api/charts/"  
  end

  def get_url(preference, region) 
  #  string = JSON.load(open(@base_url)) 
    "#{@base_url}#{preference}/#{region}/latest"
  end

  def get_json(url)
     JSON.load(open(url))
  end

  def fetch_track_album_artist(music_hash)
  
    # given a hash, like the one above, this method should return a string like:
    # '<track name>' by <artist name> from the <album name>
    # the track name, artist name, and album name should be the first track in the
    # tracks array
    tracks = music_hash["tracks"]
    track_name = tracks[0]["track_name"]
    artist_name = tracks[0]["artist_name"]
    album_name = tracks[0]["album_name"]

    "'#{track_name}' by #{artist_name} from the album #{album_name}"
    # example music_hash:
    # {  
    #   "tracks" => [  
    #  ******************  array[0] would be considered TOP tracks  ***************
    # {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"All About That Bass",
    #       "artist_name"  =>"Meghan Trainor",
    #       "album_name"   =>"Title"
    #     },
    # ****************** array[1] would be SECOND top tracks. ******************

    # ****************** array[0]["track_name"] would be track_name **************
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"Break Free",
    #       "artist_name"  =>"Ariana Grande",
    #       "album_name"   =>"Break Free"
    #     }
    #   ]
    # }
  end


  def most_streamed(region)
    # call on get_url here, where preference is the string 'most_streamed',
    # and set it equal to a variable
   most_streamed_string = get_url("most_streamed", region)

    # call on get_json here, using the string that get_url returns
    most_streamed_hash = get_json(most_streamed_string)
    
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
    fetch_track_album_artist(most_streamed_hash)
  end

  def most_shared(region)
    # call on get_url here, where preference is the string 'most_shared',
    # and set it equal to a variable
    most_shared_string =  get_url("most_shared", region)

    # call on get_json here, using the string that get_url returns
    most_shared_hash = get_json(most_shared_string)

    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
    fetch_track_album_artist(most_shared_hash)
  end

end
