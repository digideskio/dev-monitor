class AddPidToBoris < ActiveRecord::Migration
  def change
    add_column :boris, :pid, :integer
  end
end
