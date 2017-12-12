class RemoveOldPasswordFromUsers < ActiveRecord::Migration[5.1]
  def up
    remove_column :users, :password
  end

  def down
      add_column :users, :password, :string
  end
end
