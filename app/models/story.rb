class Story < ActiveRecord::Base
  belongs_to :author, class_name: User
  belongs_to :performer, class_name: User

  has_many :story_comments

  validates :title, presence: true, length: {minimum: 5, maximum: 255}

  default_scope { order('created_at DESC') }

  state_machine initial: :new do
    event :start do
      transition [:rejected,:new] => :started
    end

    event :finish do
      transition :started => :finished
    end

    event :accept do
      transition :finished => :accepted
    end

    event :reject do
      transition :finished => :rejected
    end
  end
end
