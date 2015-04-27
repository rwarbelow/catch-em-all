class Pokemon < ActiveRecord::Base
  has_many :captures
  has_many :games, through: :captures
end
