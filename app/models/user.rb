class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :classroom

  has_many :classrooms, foreign_key: 'teacher_id'

  has_many :proficiencies, foreign_key: 'student_id'
  has_many :search_histories, foreign_key: 'student_id'

  scope :teachers, -> { where(role: 'Teacher') }
  scope :students, -> { where(role: 'Student') }

  def save_history(keyword)
    history = self.search_histories.where('keywords LIKE ?', "%#{keyword}%").first
    history.blank? ? self.search_histories.create(keywords: keyword) : history.increment(:hits).save
  end

end
