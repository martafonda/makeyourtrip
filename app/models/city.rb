class City < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of   :comment, maximum: 200
end
