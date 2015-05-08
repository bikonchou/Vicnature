class UserAddIndexAccount < ActiveRecord::Migration
  def change
  	add_index :users, :account, unique: true
  end
end
