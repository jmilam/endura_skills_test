class AddFielddsToUserTable < ActiveRecord::Migration[5.0]
  def change
  	 	add_column :users, :email, :string
    	add_column :users, :complete, :boolean
    	add_column :users, :completed_date, :date
  end
end
