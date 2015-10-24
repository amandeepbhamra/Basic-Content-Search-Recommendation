class CreateSearchHistories < ActiveRecord::Migration
  def change
    create_table :search_histories do |t|
      t.belongs_to :student
      t.string :keywords
      t.integer :hits

      t.timestamps null: false
    end
  end
end
