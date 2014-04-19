class CreatePois < ActiveRecord::Migration
  def change
    create_table :pois do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.string :address

      t.timestamps
    end
  end
end
