class AddColumnTeacherIdToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :teacher_id, :integer
  end
end
