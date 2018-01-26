class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :score
      t.references :user, foreign_key: true
      t.references :votable, polymorphic: true

      t.timestamps
    end
  end
end
