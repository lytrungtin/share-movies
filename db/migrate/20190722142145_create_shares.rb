class CreateShares < ActiveRecord::Migration[5.1]
  def change
    create_table :shares do |t|
      t.string :url
      t.string :title
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :shares, [:user_id, :created_at]
  end
end
