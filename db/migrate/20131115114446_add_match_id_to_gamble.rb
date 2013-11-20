class AddMatchIdToGamble < ActiveRecord::Migration
  def change
    add_column :gambles, :match_id, :integer
    add_index :gambles, :match_id
  end
end
