class Classroom < ActiveRecord::Base

  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'

  has_many :students, class_name: 'User', foreign_key: 'classroom_id'

  has_many :subjects, as: :subjectable

  has_many :topics, through: :subjects
end
