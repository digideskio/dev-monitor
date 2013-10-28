class AddPidFileToBoris < ActiveRecord::Migration
  def change
    add_column :boris, :pid_file, :string
  end
end
