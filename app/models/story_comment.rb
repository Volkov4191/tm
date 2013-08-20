class StoryComment < ActiveRecord::Base
  belongs_to :story
  belongs_to :author, class_name: User

  validates :body, presence: true
end
