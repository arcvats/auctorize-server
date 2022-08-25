class Organization < ApplicationRecord
  has_many :users
  has_many :roles, through: :users
  has_many :groups, through: :users

  validates :uid, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :subdomain, allow_blank: true, uniqueness: { case_sensitive: false }

  before_validation :initialize_values

  private

  def initialize_values
    self.uid = SecureRandom.uuid if self.uid.blank?
    self.access_token = SecureRandom.uuid if self.access_token.blank?
  end
end
