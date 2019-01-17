class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications
  
  #class methods 
  
  def self.first_five
    all.limit(5)
  end 
  
end
