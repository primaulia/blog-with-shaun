class CreateParks < ActiveRecord::Migration[5.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :description
      t.string :picture
      t.boolean :status
      t.timestamps
    end
  end
end
