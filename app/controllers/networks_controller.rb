class NetworksController < ApplicationController
  include Pagy::Backend
     
        def index

          @asongs = Song.joins("JOIN albums ON songs.report_id = albums.report_id").select("songs.id, songs.report_id, songs.updated_at, songs.longitude, songs.latitude, albums.id AS album_id, albums.category AS album_category, albums.report_id AS album_report_id, albums.validatiertdurch AS album_validatiertdurch")

          @asongs = @asongs.where(albums: { category: Album.categories[:active] }).order(created_at: :desc)
          @pagy, @asongs = pagy(@asongs, items: 30)


          respond_to do |format|
            format.html
            format.js
          end
        end
    end
      