class CreateProficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
      t.belongs_to :student
      t.belongs_to :subject
      t.decimal :marks_in_perc

      t.timestamps null: false
    end
  end
end
