class Championship < ActiveRecord::Base
  attr_accessible :active, :desc, :end_date, :name, :start_date
  has_and_belongs_to_many :users
  has_many :groups
end
