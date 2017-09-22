class AddAdminFlagToLogin < ActiveRecord::Migration[5.0]
  def change
  	add_column :logins, :admin, :boolean, default:false
  end
end
