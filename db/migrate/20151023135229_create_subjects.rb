class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.text :decription
      t.references :subjectable, polymorphic: :true

      t.timestamps null: false
    end
  end
end
