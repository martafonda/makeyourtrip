class Place < ActiveRecord::Base
  validates_presence_of :name, :address, :datetime
  belongs_to :city
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
