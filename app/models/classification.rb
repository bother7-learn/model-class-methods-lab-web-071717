class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    self.all.uniq
  end

  def self.longest
    Classification.where(id: BoatClassification.select(:classification_id).where(id: BoatClassification.where(boat_id: Boat.order(length: :desc).limit(1).ids.first).ids))
  end
end
