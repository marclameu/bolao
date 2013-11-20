class AddStartDateAndEndDateToGroup < ActiveRecord::Migration
  def up
    add_column :groups, :start_date, :datetime
    add_column :groups, :end_date, :datetime
  end

  def down
    remove_column :groups, :start_date
    remove_column :groups, :end_date
  end
end
