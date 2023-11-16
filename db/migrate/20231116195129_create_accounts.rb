class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do 
      t.string :user_name
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
