class Gamble < ActiveRecord::Base
  belongs_to :user
  belongs_to :match
  attr_accessible :integer, :team_away_score, :team_home_score, :match_id
end
