class Player < ActiveRecord::Base
  validates :display_name, :uniqueness => true
  has_many :lines
  belongs_to :roster

  def self.search(query)
    where('display_name LIKE ?',"%#{query}%")
  end

  def average_stat stat 
    avg = self.send(stat.to_sym).to_f / self.lines.count.to_f   
    avg.round(2)
  end
end
