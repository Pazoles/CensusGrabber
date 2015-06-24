class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :statefp
      t.integer :placefp
      t.string :concat
      t.string :city
      t.string :state
      t.string :placename
      t.string :county

      t.timestamps null: false
    end
  end
end
