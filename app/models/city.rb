class City < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of   :comment, maximum: 200

  has_many :traveltickets , dependent: :destroy
  has_many :places , dependent: :destroy
  geocoded_by :name
  after_validation :geocode, :if => :name_changed?
end
