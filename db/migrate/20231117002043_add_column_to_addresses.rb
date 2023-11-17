class AddColumnToAddresses < ActiveRecord::Migration[7.0]
  def change
      add_column :address, :street_number, :integer 
      add_column :address, :zip, :integer
      add_column :address, :street_name, :string
      add_column :address, :city, :string
      add_column :address, :state, :string
  end
end
