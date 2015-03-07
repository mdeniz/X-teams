class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :team
      t.string :name
      t.text :description
      t.date :start
      t.date :end
      t.float :achieved
      t.integer :priority
      t.timestamps null: false
    end
  end
end
