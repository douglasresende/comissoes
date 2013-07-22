class User < ActiveRecord::Base
  attr_accessible :email, :full_name, :password, :password_confirmation
  validates_presence_of :full_name, :password
  validates_confirmation_of :password
  validates :email, :presence => true,
                    :format => { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ },
                    :uniqueness => true
  
  has_secure_password

  has_many :products

  before_create :generate_token

  scope :confirmed, where('confirmed_at IS NOT NULL')

  def generate_token
  	self.confirmation_token = SecureRandom.urlsafe_base64
  end

  def self.authenticate(email, password)
    confirmed.
      find_by_email(email).
      try(:authenticate, password)
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
