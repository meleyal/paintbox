require 'digest'

class User < ActiveRecord::Base

  has_many :swatches, :dependent => :destroy
  has_many :colors,   :through => :swatches

  attr_accessor   :password
  attr_accessible :username, :email, :password, :password_confirmation

  validates_presence_of     :username
  validates_length_of       :username, :maximum => 50
  validates_format_of       :username, :with => /\A[a-z]+\z/
  validates_uniqueness_of   :username, :case_sensitive => true  
  validates_presence_of     :email
  validates_format_of       :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_uniqueness_of   :email, :case_sensitive => true
  validates_presence_of     :password
  validates_length_of       :password, :within => 6..40
  validates_confirmation_of :password
  before_save               :encrypt_password

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def remember_me!
    self.remember_token = encrypt("#{salt}--#{id}--#{Time.now.utc}")
    save_without_validation
  end

private
  
  def encrypt_password
    unless password.nil?
      self.salt = make_salt
      self.encrypted_password = encrypt(password)
    end
  end

  def encrypt(string)
    secure_hash("#{salt}#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

end