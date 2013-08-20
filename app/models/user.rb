class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :password, :on => :create

  validates :email, :presence => true,
            :length => {:minimum => 3, :maximum => 254},
            :uniqueness => true

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :password, :presence => true, :length => {:minimum => 4}
end