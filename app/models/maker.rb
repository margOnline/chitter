require 'bcrypt'

class Maker
  include DataMapper::Resource

  has n, :peeps

  property :id, Serial
  property :name, String
  property :email, String, :unique => true, :message => "This email address has already been registered"
  property :username, String, :unique => true, :message => "This username is taken, please choose another one"
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, :message => "The passwords you entered do not match, please try again"
  validates_uniqueness_of :email, :username

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    maker = first(:email =>)
    if maker && BCrypt::Password.new(maker.password_digest) == password
      maker
    else
      nil
    end
  end

end