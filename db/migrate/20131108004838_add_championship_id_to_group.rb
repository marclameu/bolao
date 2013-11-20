class AddChampionshipIdToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :championship_id, :integer
    add_index :groups, :championship_id
  end
end
