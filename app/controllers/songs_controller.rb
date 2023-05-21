

class SongsController < ApplicationController
    
  skip_before_action :authenticate_user!, only: [:index] 


  def my
      # @albums = Album.where(validatiertdurch: current_user.id)
      # @albums = Album.where(validatiertdurch: current_user.id)
      # @albums = Album.where(validatiertdurch: current_user.id)
      @songs_with_parent_album_info = Song.joins("JOIN albums ON songs.report_id = albums.report_id").select("songs.id, songs.report_id, songs.metersfromgroundzero, songs.longitude, songs.latitude, albums.id AS album_id, albums.category AS album_category, albums.report_id AS album_report_id, albums.validatiertdurch AS album_validatiertdurch")
      
      @songs_with_parent_album_info = @songs_with_parent_album_info.where(albums: { validatiertdurch: current_user.id })
       #   if params[:song_id].present?
      #      @songs_with_parent_album_info = @songs_with_parent_album_info.where("songs.id = ?", params[:song_id])
     #     end
              # @albums = Album.where(validatiertdurch: current_user.id)

    # @songs_with_parent_album_info = @songs_with_parent_album_info.where(albums: { validatiertdurch: current_user.id })

      if params[:album_report_id].present?
        @songs_with_parent_album_info = @songs_with_parent_album_info.where("albums.report_id = ?", params[:album_report_id])
      end

      if params[:album_category].present?
        @songs_with_parent_album_info = @songs_with_parent_album_info.where(albums: { category: params[:album_category] }) 
      end
      
    # @album_statuses = Album.pluck(:status).uniq
      @songs_with_parent_album_info = @songs_with_parent_album_info.to_a.map { |song| { id: song.id, title: song.report_id, distance_in_meters:metersfromgroundzero, longitude: song.longitude, latitude: song.latitude,  album_id: song.album_id, album_report_id: song.album_report_id, album_category: song.album_category } }
     
  end

    def show
      @songs = Song.where(report_id: params[:report_id])
    end


    def index
    #  @songs_with_parent_album_info = Song.joins("JOIN albums ON songs.report_id = albums.report_id").select("songs.id, songs.report_id, songs.longitude, albums.id AS album_id, albums.category AS album_category, albums.report_id AS album_report_id")
    if current_user.present?
      @songs_with_parent_album_info  = Song.joins("JOIN albums ON songs.report_id = albums.report_id")
      .select("songs.id, songs.created_at, songs.report_id, songs.metersfromgroundzero, songs.longitude, songs.latitude, albums.id AS album_id, albums.category AS album_category, albums.report_id AS album_report_id, albums.validatiertdurch AS album_validatiertdurch")

      @songs_with_parent_album_info = @songs_with_parent_album_info.where(albums: { validatiertdurch: current_user.id })

      else
        # Handle the case where current_user is nil
      end

        #  if params[:song_id].present?
     #       @songs_with_parent_album_info = @songs_with_parent_album_info.where("songs.id = ?", params[:song_id])
       #   end
       if current_user.present?

      if params[:album_report_id].present?
        @songs_with_parent_album_info = @songs_with_parent_album_info.where("albums.report_id = ?", params[:album_report_id])
      end
    else
      # Handle the case where current_user is nil
    end

      if current_user.present?

      if params[:album_category].present?
        @songs_with_parent_album_info = @songs_with_parent_album_info.where(albums: { category: params[:album_category] }) 
      end    
    else
      # Handle the case where current_user is nil
    end

      #@album_statuses = Album.pluck(:status).uniq
      #@songs_with_parent_album_info = @songs_with_parent_album_info.to_a.map { |song| { id: song.id, title: song.report_id, created_at: song.created_at, distance_in_meters: song.metersfromgroundzero, tooltip: song.tooltip, longitude: song.longitude, album_id: song.album_id, album_report_id: song.album_report_id, album_category: song.album_category, album_validatiertdurch: song.album_validatiertdurch} }
      #@songs_with_parent_album_info = @songs_with_parent_album_info.to_a.map { |song| { id: song.id, title: song.report_id, longitude: song.longitude, latitude: song.latitude, album_id: song.album_id, album_report_id: song.album_report_id, album_category: song.album_category, album_validatiertdurch: song.album_validatiertdurch} }

      @songs_with_parent_album_info = @songs_with_parent_album_info.order(created_at: :desc).to_a.map { |song| { id: song.id, title: song.report_id, created_at: song.created_at, distance_in_meters: song.metersfromgroundzero, longitude: song.longitude, latitude: song.latitude, album_id: song.album_id, album_report_id: song.album_report_id, album_category: song.album_category, album_validatiertdurch: song.album_validatiertdurch} }

     # @pagy, @songs_with_parent_album_info = pagy(@songs_with_parent_album_info.order(created_at: :desc).to_a.map { |song| { id: song.id, title: song.report_id, created_at: song.created_at, distance_in_meters: song.metersfromgroundzero, longitude: song.longitude, latitude: song.latitude, album_id: song.album_id, album_report_id: song.album_report_id, album_category: song.album_category, album_validatiertdurch: song.album_validatiertdurch} })


      #@asongs = Song.joins("JOIN albums ON songs.report_id = albums.report_id").select("songs.id, songs.created_at, songs.report_id, songs.metersfromgroundzero, songs.longitude, albums.id AS album_id, albums.category AS album_category, albums.report_id AS album_report_id")
      


      respond_to do |format|
        format.html
        format.js
      end
    end
 
   
end