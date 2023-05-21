class AlbumsController < ApplicationController



    def index
      # @albums = Album.where(validatiertdurch: current_user.id)
      @albums = Album.all
=begin 
      @spezi = Hash.new(0)
      @albums.each do |album|
        @spezi[album.id] = album.songs.where(report_id: album.report_id).count
      end 
=end


    redirect_to valid_airdrip_path


    end


    def show


      redirect_to valid_airdrip_path


      #@album = Album.find_by(id: params[:report_id])
      #@songs = Song.where(report_id: @album.report_id)

      #@songs = @album.songs
      #@album = Album.find_by(report_id: params[:id])
      #@album = Album.find(report_id: params[:report_id])
      #@songs = Song.where(report_id: @album.report_id)
      #@album = Album.find_by(report_id: params[:report_id])

      #@spezi = @album.songs.where(report_id: @album.report_id, validatiertdurch: current_user.id).count

    
      
    end
   
    def validate
      #@album = Album.find(params[:id])
      @album = Album.find_by(id: params[:report_id])

      if @album.validate_code(params[:code], current_user.id)
        flash[:notice] = "Validation code successfully applied."
      else
        flash[:alert] = "Invalid validation code."
      end
      redirect_to @album
    end

    

    def dashboard
      @album = Album.find(params[:id])
      @songs = @album.songs

      @spezi = @album.songs.where(report_id: @album.report_id, validatiertdurch: current_user.id).count

    end

    
    def dashboard
      @albums = current_user.albums.includes(:songs)
    end
    
    

end
  