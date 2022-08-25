class User < ApplicationRecord

  PASSWORD_FORMAT = /\A
    (?=.{8,})          # Must contain 8 or more characters
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
  /x

  has_secure_password

  belongs_to :organization

  has_many :user_roles
  has_many :roles, through: :user_roles

  has_many :user_groups
  has_many :groups, through: :user_groups

  validates :uid, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence:true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, format: { with: PASSWORD_FORMAT }

  before_validation :initialize_values

  private

  def initialize_values
    self.uid = SecureRandom.uuid if self.uid.blank?
  end
end
