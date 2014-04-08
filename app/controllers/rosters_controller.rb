class RostersController < ApplicationController
  def show
    @roster = Roster.find(params[:id])

    #TODO: ROSTER BUILDER TOOL
  end


end 