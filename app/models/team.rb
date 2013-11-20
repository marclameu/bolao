class Team < ActiveRecord::Base
  attr_accessible :abbreviation, :code, :name
  has_many :matches
end
