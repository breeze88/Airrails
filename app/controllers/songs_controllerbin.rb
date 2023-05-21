def index
    @songs_with_parent_album_info = ActiveRecord::Base.connection.execute("
      SELECT s.id, s.title, s.duration, a.title AS album_title, a.artist AS album_artist
      FROM songs s
      JOIN albums a ON s.report_id = a.report_id
      WHERE s.#{params[:filter_attribute]} LIKE '%#{params[:filter_value]}%'
        AND s.id = #{params[:filter_id].to_i if params[:filter_id].present?}
        AND a.genre = '#{params[:filter_genre]}' OR '#{params[:filter_genre]}' = ''
    ").to_a.map { |row| OpenStruct.new(row) }
  end




  def index
      @songs_with_parent_album_info = Song.joins("JOIN albums ON songs.report_id = albums.report_id")
                                           .select("songs.id, songs.title, songs.duration, albums.title AS album_title, albums.artist AS album_artist")
      if params[:album_artist].present?
        @songs_with_parent_album_info = @songs_with_parent_album_info.where("albums.artist = ?", params[:album_artist])
      end
      @songs_with_parent_album_info = @songs_with_parent_album_info.to_a.map { |song| { id: song.id, title: song.title, duration: song.duration, album_title: song.album_title, album_artist: song.album_artist } }
      @album_artists = Album.select(:artist).distinct.pluck(:artist)
  end

  
  def index
    #@songs = Song.where(report_id: @report_id)


    #@report_id = params[:report_id]
    #@songs = Song.where(report_id: params[:report_id])
    #@songs = Song.all


      @songs_with_parent_album_info = Song.joins("JOIN albums ON songs.report_id = albums.report_id")
                                           .select("songs.id, songs.report_id, songs.longitude, albums.id AS album_id, albums.report_id AS album_report_id")
                                           .to_a
                                           .map { |song| { id: song.id, title: song.report_id, longitude: song.longitude, album_id: song.album_id, album_report_id: song.album_report_id } }
   


    
  end



  def index
    @songs_with_parent_album_info = Song.joins("JOIN albums ON songs.report_id = albums.report_id").select("songs.id, songs.report_id, songs.longitude, albums.id AS album_id, albums.report_id AS album_report_id, albums.status AS album.status").order("songs.id ASC")
    if params[:song_id].present?
      @songs_with_parent_album_info = @songs_with_parent_album_info.where("songs.id = ?", params[:song_id])
    end
    if params[:album_genre].present?
      @songs_with_parent_album_info = @songs_with_parent_album_info.where("albums.genre = ?", params[:album_genre])
    end
    if params[:album_artist].present?
      @songs_with_parent_album_info = @songs_with_parent_album_info.where("albums.artist = ?", params[:album_artist])
    end

    @songs_with_parent_album_info = @songs_with_parent_album_info.to_a.map do { |song| { id: song.id, title: song.report_id, longitude: song.longitude,     album: {
        album_id: song.album_id,
        album_report_id: song.album_report_id,
        album_status: song.album_status
      }
       }}
    
  end
  




    #works without albums.status



  def index
    @songs_with_parent_album_info = Song.joins("JOIN albums ON songs.report_id = albums.report_id").select("songs.id, songs.report_id, songs.longitude, albums.id AS album_id, albums.report_id AS album_report_id, albums.status AS album.status")
    if params[:song_id].present?
      @songs_with_parent_album_info = @songs_with_parent_album_info.to_i.where("songs.id = ?", params[:song_id])
    end
    if params[:album_genre].present?
      @songs_with_parent_album_info = @songs_with_parent_album_info.where("albums.genre = ?", params[:album_genre])
    end
    if params[:album_artist].present?
      @songs_with_parent_album_info = @songs_with_parent_album_info.where("albums.artist = ?", params[:album_artist])
    end

    @songs_with_parent_album_info = @songs_with_parent_album_info.to_a.map { |song| { id: song.id, title: song.report_id, longitude: song.longitude, album_id: song.album_id, album_report_id: song.album_report_id, album_status: song.album_status } }
    
  end
  
    #works with albums.status



  def index
    @songs_with_parent_album_info = Song.joins("JOIN albums ON songs.report_id = albums.report_id").select("songs.id, songs.report_id, songs.longitude, albums.id AS album_id, albums.statusp AS album_statusp, albums.report_id AS album_report_id")
    if params[:song_id].present?
      @songs_with_parent_album_info = @songs_with_parent_album_info.to_i.where("songs.id = ?", params[:song_id])
    end
    if params[:album_genre].present?
      @songs_with_parent_album_info = @songs_with_parent_album_info.where("albums.genre = ?", params[:album_genre])
    end
    if params[:album_artist].present?
      @songs_with_parent_album_info = @songs_with_parent_album_info.where("albums.artist = ?", params[:album_artist])
    end

    @songs_with_parent_album_info = @songs_with_parent_album_info.to_a.map { |song| { id: song.id, title: song.report_id, longitude: song.longitude, album_id: song.album_id, album_report_id: song.album_report_id, album_statusp: song.album_statusp } }
    
  end


    #strange with select! in the controller


  @songs_with_parent_album_info = Song.joins("JOIN albums ON songs.report_id = albums.report_id").select("songs.id, songs.report_id, songs.longitude, albums.id AS album_id, albums.statusp AS album_statusp, albums.report_id AS album_report_id")

  # Filter by song_id
  if params[:song_id].present?
    @songs_with_parent_album_info = @songs_with_parent_album_info.select! { |song| song['id'] == params[:song_id].to_i }
  end
      # Filter by tag status

  if params[:album_statusp].present?
    @songs_with_parent_album_info = @songs_with_parent_album_info.select! { |song| song['album_statusp'] == params[:album_statusp] }
  end

# Filter by tag name

  if params[:album_report_name].present?
    @songs_with_parent_album_info = @songs_with_parent_album_info.select! { |song| song['album_report_name'] == params[:album_report_name] }
  end

  # mapping for views

  @songs_with_parent_album_info = @songs_with_parent_album_info.to_a.map { |song| { id: song.id, title: song.report_id, longitude: song.longitude, album_id: song.album_id, album_report_id: song.album_report_id, album_statusp: song.album_statusp } }
  



----------------------------------------------------------------------------------------------------------



  best one: 


    def index
    @songs_with_parent_album_info = Song.joins("JOIN albums ON songs.report_id = albums.report_id").select("songs.id, songs.report_id, songs.longitude, albums.id AS album_id, albums.statusp AS album_statusp, albums.report_id AS album_report_id")
    if params[:song_id].present?
      @songs_with_parent_album_info = @songs_with_parent_album_info.to_i.where("songs.id = ?", params[:song_id])
    end
    if params[:album_statusp].present?
      @songs_with_parent_album_info = @songs_with_parent_album_info.where("albums.statusp = ?", params[:album_statusp])
    end
    if params[:album_report_name].present?
      @songs_with_parent_album_info = @songs_with_parent_album_info.where("albums.report_name = ?", params[:album_report_name])
    end
     # @album_statuses = Album.pluck(:status).uniq
    @songs_with_parent_album_info = @songs_with_parent_album_info.to_a.map { |song| { id: song.id, title: song.report_id, longitude: song.longitude, album_id: song.album_id, album_report_id: song.album_report_id, album_statusp: song.album_statusp } }
    render partial: 'list', locals: { songs_with_parent_album_info: @songs_with_parent_album_info }
    end

    ---------------------------------------------------------------------------------------------------------------