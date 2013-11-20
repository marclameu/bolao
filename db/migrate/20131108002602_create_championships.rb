class CreateChampionships < ActiveRecord::Migration
  def change
    create_table :championships do |t|
      t.string :name
      t.string :desc
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :active

      t.timestamps
    end
  end
end
