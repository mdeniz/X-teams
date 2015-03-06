class CreateMutants < ActiveRecord::Migration
  def change
    create_table :mutants do |t|
      t.string :name
      t.string :aliases
      t.string :real_name
      t.string :image
      t.string :email
      t.string :mobile
      t.string :place_of_birth
      t.string :identity
      t.text :biography
      t.integer :height
      t.integer :weight
      t.string :eyes
      t.string :hair
      t.string :skintone
      t.string :more_info_link
      t.timestamps null: false
    end
    add_index :mutants, :name, unique: true
  end
end
