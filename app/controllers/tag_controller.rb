class TagController < SongsController

    skip_before_action :authenticate_user!, only: [:index] 
  
    def show
        @songs = Song.where(report_id: params[:report_id])
    end

 
    def index
        @report_id = params[:report_id]
        #@songs = Song.where(report_id: @report_id)
        #@songs = Song.where(report_id: params[:report_id])
        @songs = Song.where(report_id: params[:report_id])
    end
  
  
end
