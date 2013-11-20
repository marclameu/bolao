class AddActiveToGroup < ActiveRecord::Migration
  def up
    add_column :groups, :active, :boolean, default: true
  end

  def down
    remove_column :groups, :active
  end
end
