class AddCompleteToLogin < ActiveRecord::Migration[5.0]
  def change
  	add_column :logins, :complete, :boolean, default:false
  end
end
