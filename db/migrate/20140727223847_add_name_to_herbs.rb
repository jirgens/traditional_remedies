class AddNameToHerbs < ActiveRecord::Migration
  def change
    add_column :herbs, :name, :string
    add_column :herbs, :latin_name, :string
    add_column :herbs, :description, :text
  end
end
