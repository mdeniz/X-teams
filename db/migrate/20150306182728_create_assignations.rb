class CreateAssignations < ActiveRecord::Migration
  def change
    create_table :assignations do |t|
      t.belongs_to :mutant
      t.belongs_to :task
      t.timestamps null: false
    end
  end
end
