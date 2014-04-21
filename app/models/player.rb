class Player < ActiveRecord::Base
  validates :display_name, :uniqueness => true
  has_many :lines
  belongs_to :roster

  def self.search(query)
    where('display_name LIKE ?',"%#{query}%")
  end
end
