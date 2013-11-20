class Match < ActiveRecord::Base
  belongs_to :team_home, :class_name => 'Team', :foreign_key => 'team_home_id'
  belongs_to :team_alway, :class_name => 'Team', :foreign_key => 'team_alway_id'
  belongs_to :group
  has_many :matches
  attr_accessible :date_match, :score_team_away, :score_team_home, :team_home_id, :team_alway_id, :group_id
end
