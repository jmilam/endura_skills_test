class AddTestNumToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :test_num, :string
  end
end
