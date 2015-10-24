class Resource < ActiveRecord::Base

  belongs_to :subject

  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by(name: name).resources
  end

  def tag_list
    tags.map(&:name).join(", ")
  end
end
