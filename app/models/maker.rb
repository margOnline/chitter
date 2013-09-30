require 'bcrypt'

class Maker
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String 
  property :username, String 
  property :password_digest, Text

  has n, :peep
  
  attr_reader :password
  attr_accessor :password_confirmation
  
  validates_confirmation_of :password, :message => "The passwords you entered do not match, please try again"
  validates_uniqueness_of :email, :message => "This email address has already been registered"
  validates_uniqueness_of :username, :message => "This username is taken, please choose another one"
  validates_presence_of :username, :email, :first_name, :last_name

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    maker = first(:email => email)
    if maker && BCrypt::Password.new(maker.password_digest) == password
      maker
    else
      nil
    end
  end

end