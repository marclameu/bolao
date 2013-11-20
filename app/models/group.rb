class Group < ActiveRecord::Base
  attr_accessible :desc, :name
  has_many :matches  
  belongs_to :championship
  scope :actives, where(:active => true).includes(:matches => [:team_home, :team_alway]).order(:name)
end
