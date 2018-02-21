class AddPicsToStrippers < ActiveRecord::Migration[5.1]
  def change
    add_column :strippers, :pics1, :string
    add_column :strippers, :pics2, :string
    add_column :strippers, :pics3, :string
    add_column :strippers, :pics4, :string
  end
end
