class RemovePicsFromStrippers < ActiveRecord::Migration[5.1]
  def change
    remove_column :strippers, :pics, :string
  end
end
