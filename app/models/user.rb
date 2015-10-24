class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :classroom

  has_many :classrooms, foreign_key: 'teacher_id'

  scope :teachers, -> { where(role: 'Teacher') }
  scope :students, -> { where(role: 'Student') }
end
