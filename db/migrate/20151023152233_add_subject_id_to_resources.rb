class AddSubjectIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :subject_id, :integer
  end
end
