class AddSlugToBoris < ActiveRecord::Migration
  def change
    add_column :boris, :slug, :string
  end
end
