class RostersController < ApplicationController
  def show
    @roster = Roster.find(params[:id])
  end


end 