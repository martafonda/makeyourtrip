class Travelticket < ActiveRecord::Base
  validates_presence_of :origin, :destination, :type
  belongs_to :city
  self.inheritance_column = nil
  TYPE = ['train', 'plain', 'bus'].sort
end
