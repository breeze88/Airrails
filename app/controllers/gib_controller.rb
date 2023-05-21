class GibController < ApplicationController

    def aktion
        @data = [1, 2, 3, 4, 5]
    end

    def index
      redirect_to root_path
    end

    def show
  
  
      #  @album = Album.find_by(id: params[:report_id])
        #@songs = Song.where(report_id: @album.report_id)
  
       # @songs = @album.songs
        @album = Album.find_by(report_id: params[:report_id])
      #    @album = Album.find(report_id: params[:report_id])
        #@songs = Song.where(report_id: @album.report_id)
    end
     
    def validate
        @album = Album.find(params[:id])
        if @album.validate_code(params[:code], current_user.id)
          flash[:notice] = "Validation code successfully applied."
        else
          flash[:alert] = "Invalid validation code."
        end
        redirect_to @album
    end
  





end
