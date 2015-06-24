class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :code
      t.string :category
      t.string :variable
      t.string :datatype

      t.timestamps null: false
    end
  end
end
