class ScoreboardsController < ApplicationController
    

    skip_before_action :authenticate_user!, only: [:index] 

    
    def index


      @apsongs = Song.joins("JOIN albums ON songs.report_id = albums.report_id").select("songs.id, songs.report_id, songs.metersfromgroundzero, songs.created_at, songs.longitude, songs.latitude, albums.id AS album_id, albums.category AS album_category, albums.report_id AS album_report_id, albums.validatiertdurch AS album_validatiertdurch, albums.score AS album_score")

      @apsongs =  @apsongs.where(albums: { validatiertdurch: current_user.id })

      @apsongs =  @apsongs.where(albums: { category: Album.categories[:active] }).order(created_at: :desc)

      @pagy, @apsongs = pagy(@apsongs, items: 30)


      @sum_of_album_scores = @apsongs.sum('albums.score')


      respond_to do |format|
        format.html
        format.js
      end
    end
end
  