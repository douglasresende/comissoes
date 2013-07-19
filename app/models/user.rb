class User < ActiveRecord::Base
  attr_accessible :email, :full_name, :password, :password_confirmation
  validates_presence_of :full_name, :password
  validates_confirmation_of :password
  validates :email, :presence => true,
                    :format => { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ },
                    :uniqueness => true
  
  has_secure_password

  before_create :generate_token

  def generate_token
  	self.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirm!
    return if confirmed?
    self.password = self.password_digest
    self.confirmed_at = Time.current
    self.confirmation_token = ''
    save!
  end

  def confirmed?
  	confirmed_at.present?
  end
end
