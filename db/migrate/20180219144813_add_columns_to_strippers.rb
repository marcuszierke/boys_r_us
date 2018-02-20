class AddColumnsToStrippers < ActiveRecord::Migration[5.1]
  def change
    add_column :strippers, :name, :string
    add_column :strippers, :review, :float
    add_column :strippers, :city, :string
    add_column :strippers, :price, :integer
    add_column :strippers, :height, :integer
    add_column :strippers, :description, :text
    add_column :strippers, :hair_color, :string
    add_column :strippers, :eye_color, :string
    add_column :strippers, :ethnicity, :string
    add_column :strippers, :characters, :string
    add_column :strippers, :solo, :boolean
    add_column :strippers, :availability, :boolean
    add_column :strippers, :pics, :string
    add_column :strippers, :age, :integer
  end
end
