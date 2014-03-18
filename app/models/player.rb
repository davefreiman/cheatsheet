class Player < ActiveRecord::Base
  validates :display_name, :uniqueness => true
  has_many :lines
end