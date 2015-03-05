class CreateMutants < ActiveRecord::Migration
  def change
    create_table :mutants do |t|
      t.string :mutant_name
      t.string :alias
      t.string :real_name
      t.string :sex
      t.string :skintone
      t.string :place_of_birth
      t.string :country
      t.text :description
      t.integer :height
      t.integer :weight
      t.string :eyes
      t.string :hair
      t.timestamps null: false
    end
    add_index :mutants, :mutant_name, unique: true
  end
end
