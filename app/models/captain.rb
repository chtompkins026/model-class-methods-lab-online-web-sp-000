class Captain < ActiveRecord::Base
  has_many :boats
  
  def self.catamaran_operators 
    joins(boats: [:classifications]).where(classifications: {name: "Catamaran"})
  end 
  
  def self.sailors 
    joins(boats: [:classifications]).where(classifications: {name: "Sailboat"}).uniq 
  end
  
   def self.motorists
    joins(boats: [:classifications]).where(classifications: {name: "Motorboat"}).uniq
  end
  
  def self.talented_seafarers
    where("id IN (?) and id IN (?)", self.sailors.pluck(:id), self.motorists.pluck(:id))
  end
  
  def self.non_sailors
    where.not("id IN (?)", self.sailors(:id))
  end 
  
end



#   describe "::talented_seafarers" do
#     it "returns captains of motorboats and sailboats" do
#       captains = ["Captain Cook", "Samuel Axe"]
#       expect(Captain.talented_seafarers.pluck(:name)).to eq(captains)
#     end
#   end

#   describe "::non_sailors" do
#     it "returns people who are not captains of sailboats" do
#       captains = ["William Kyd", "Arel English", "Henry Hudson"]
#       expect(Captain.non_sailors.pluck(:name)).to eq(captains)
#     end
#   end