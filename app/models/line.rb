class Line < ActiveRecord::Base
  validates :player_id, :presence => true
  validates :identifier, :uniqueness => true
  belongs_to :player

  
  def ftime
    self.event_date.strftime("%b %d, %Y")
  end
end
