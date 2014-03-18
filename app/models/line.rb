class Line < ActiveRecord::Base
  validates :player_id, :presence => true
  validates :identifier, :presence => true


  belongs_to :player
end
