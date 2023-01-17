class AddStaffNameToUguser < ActiveRecord::Migration[7.0]
  def change
    add_column :uguser, :staff_name, :string
  end
end
