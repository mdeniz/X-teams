class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :image
      t.string :email
      t.text :description

      t.timestamps null: false
      end
    add_index :teams, :name, unique: true
  end
end
