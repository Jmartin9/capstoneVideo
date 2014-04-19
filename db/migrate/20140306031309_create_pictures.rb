class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :poi, index: true
      t.string :image
      t.string :title
      t.boolean :approved

      t.timestamps
    end

  end
end
