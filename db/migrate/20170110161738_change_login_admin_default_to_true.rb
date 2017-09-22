class ChangeLoginAdminDefaultToTrue < ActiveRecord::Migration[5.0]
  def change
  	change_column :logins, :admin, :boolean, default: true
  end
end
