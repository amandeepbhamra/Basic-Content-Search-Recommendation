class Subject < ActiveRecord::Base
  
  belongs_to :subjectable, polymorphic: :true

  has_many :topics, class_name: 'Subject', as: :subjectable
  has_many :resources

end
