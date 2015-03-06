class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :image
      t.text :description
      t.boolean :enabled

      t.timestamps null: false
      end
    add_index :teams, :name, unique: true
  end
end
