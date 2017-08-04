class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    # binding.pry
  Captain.where(id: Boat.select(:captain_id).where(id: BoatClassification.select(:boat_id).where(classification_id: Classification.where(name: "Catamaran").ids.first)))
end

  def self.sailors
    Captain.where(id: Boat.select(:captain_id).where(id: BoatClassification.select(:boat_id).where(classification_id: Classification.where(name: "Sailboat").ids.first)))

  end

  def self.non_sailors
    Captain.where.not(id: Captain.joins(:boats => :classifications).where('classifications.name' => "Sailboat").ids)
  end

  def self.talented_seamen
    
    Captain.joins(:boats => :classifications).where('classifications.name' => "Sailboat").where(id: Captain.joins(:boats => :classifications).where('classifications.name' => "Motorboat").ids).uniq
  end


end
