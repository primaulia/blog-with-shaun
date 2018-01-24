class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :body
      t.references :post, foreign_key: true
      t.references :creator, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
