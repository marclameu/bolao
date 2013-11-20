class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :team_home_id, :references => "team"
      t.integer :team_alway_id, :references => "team"
      t.integer :score_team_home
      t.integer :score_team_away
      t.datetime :date_match
      t.references :group

      t.timestamps
    end
    add_index :matches, :team_home_id
    add_index :matches, :team_alway_id
  end
end
