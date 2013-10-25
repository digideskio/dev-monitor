class CreateBoris < ActiveRecord::Migration
  def change
    create_table :boris do |t|
      t.string :command_start
      t.string :command_stop
      t.string :command_restart
      t.string :name
      t.string :command_status

      t.timestamps
    end
  end
end
