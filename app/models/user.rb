class User < ActiveRecord::Base
  attr_accessible :email, :full_name, :password, :password_confirmation
  validates_presence_of :full_name, :password
  validates_confirmation_of :password
  validates :email, :presence => true,
                    :format => { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ },
                    :uniqueness => true
end
