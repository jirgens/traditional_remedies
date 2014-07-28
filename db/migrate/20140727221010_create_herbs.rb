class CreateHerbs < ActiveRecord::Migration
  def change
    create_table :herbs do |t|
      t.string :common_name, :latin_name
      t.text :description
      t.timestamps
    end
  end
end
