class Place < ActiveRecord::Base
  validates_presence_of :name, :address, :datetime
  belongs_to :city
end
