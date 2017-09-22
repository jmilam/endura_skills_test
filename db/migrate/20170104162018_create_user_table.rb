class CreateUserTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tables do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.boolean :complete
    	t.date :completed_date
    end
  end
end
