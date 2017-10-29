class User < ActiveRecord::Base
  has_many :comments
  has_many :testimonials

  validates :first_name, :last_name, :email, { presence: true }
  validates :email, { uniqueness: true }
  validate :validate_password

  #-------------------USER AUTHENTICATION-------------------

  def password
    @password ||= BCrypt::Password.new(secretized_password)
  end

  def password=(plain_text_password)
    @raw_password = plain_text_password
    @password = BCrypt::Password.create(plain_text_password)
    self.secretized_password = @password
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end

  def validate_password
    if @raw_password == ""
      errors.add(:password, "is require.")
    elsif @raw_password.length < 6
      errors.add(:password, "must be at least 6 characters.")
    end
  end
end
