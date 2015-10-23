class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :class_code

      t.timestamps null: false
    end
  end
end
