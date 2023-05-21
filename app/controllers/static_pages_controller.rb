class StaticPagesController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:landing_page]
  
  def landing_page
  end

  def dashboard
  end

  def valid_airdrip
  end
end
