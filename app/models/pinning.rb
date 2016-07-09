class Pinning < ActiveRecord::Base
# Pinning class

  belongs_to :user
  belongs_to :pin
  belongs_to :board
  
end
