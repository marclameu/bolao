class CreateGambles < ActiveRecord::Migration
  def change
    create_table :gambles do |t|
      t.integer :team_home_score
      t.integer :team_away_score
      t.references :user

      t.timestamps
    end
    add_index :gambles, :user_id
  end
end
