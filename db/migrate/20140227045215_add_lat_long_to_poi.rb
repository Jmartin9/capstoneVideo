class AddLatLongToPoi < ActiveRecord::Migration
  def change
    add_column :pois, :lat, :decimal
    add_column :pois, :long, :decimal
  end
end
