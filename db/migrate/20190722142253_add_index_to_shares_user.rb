class AddIndexToSharesUser < ActiveRecord::Migration[5.1]
  def change
    add_index :shares, :url, unique: true
  end
end
